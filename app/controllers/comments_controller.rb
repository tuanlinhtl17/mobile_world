class CommentsController < ApplicationController
  before_action :load_comment, only: :destroy
  load_and_authorize_resource  param_method: :comment_params

  def create
    @comment = Comment.new_comment comment_params
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    parent_id = @comment.parent_id
    if @comment.destroy
      render json: {
        status: :success,
        parent_id: parent_id
      }
    else
      render json: {
        status: :error
      }
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit :user_id, :mobile_id, :content, :parent_id
  end
  
  def load_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    redirect_to root_path
    flash[:danger] = t("flash.load_comment") + params[:id]
  end
end
