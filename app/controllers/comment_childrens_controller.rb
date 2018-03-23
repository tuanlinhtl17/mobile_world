class CommentChildrensController < ApplicationController
  def create
    parent = Comment.find_by id: params[:parent_id]
    @comments = parent.children.order(created_at: :asc).drop(2)
    respond_to do |format|
      format.js
    end
  end
end
