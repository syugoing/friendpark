class CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to topics_path, notice: "コメントを削除しました！"
  end

  def edit
    @comment = Comment.find(params[:id])
    @topic_id =@comment.topic.id
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to topics_path, notice: "コメントを編集しました！"
    else
      render action: 'new'
    end
  end

  def new
    if params[:back]
      @comment = Comment.new(comments_params)
    else
      @comment = Comment.new
    end
  end


  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @topic_id = @topic.id

    respond_to do |format|
      if @comment.save
       format.html { redirect_to topics_path, notice: 'コメントを投稿しました。' }
       format.json { render :index, status: :created, location: @comment }
       format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
