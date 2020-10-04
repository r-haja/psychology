class NotificationCommentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @notification_comment = NotificationComment.new
    @comments = NotificationComment.all
  end
  def create
    @comment = NotificationComment.new(notification_comment_params)
    if @comment.save
      redirect_to new_notification_comment_path
      flash[:notice] = "通知コメントを作成しました！"
    else
      flash[:alert] = "通知コメントを作成できませんでした。"
      @comments = NotificationComment.all
      render :new
    end
  end

  def destroy
  end

  def update
  end

  private
    def notification_comment_params
      params.require(:notification_comment).permit(:comment, :date_type, :action, :author)
    end
end
