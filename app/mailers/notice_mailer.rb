class NoticeMailer < ApplicationMailer

  def sendmail_topic(topic)
    @topic = topic

    mail to: @topic.user.email,
          subject: '【FriendPark】投稿がありました'
  end
end
