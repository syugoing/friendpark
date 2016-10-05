class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
    @topic = Topic.new
    @comments = Comment.all
    @comment = @topic.comments.build
    @id = 0
  end

  def show
  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "投稿しました。"
      NoticeMailer.sendmail_topic(@topic).deliver
    else
      render action: 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "投稿を編集しました。"
    else
      render action: 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, notice: "投稿をを削除しました！"
  end

  private
    def topics_params
      params.require(:topic).permit(:content)
    end

end
