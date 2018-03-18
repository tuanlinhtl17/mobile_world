class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mobile
  acts_as_tree
  validates :content, presence: true
  
  class << self
    def search_comments mobile_id, parent_id
      where(mobile_id: mobile_id, parent_id: parent_id).order(created_at: :desc)
    end
    
    def new_comment comment_params
      parent_id = comment_params[:parent_id]
      if parent_id.to_i > 0
        parent = (Comment.find_by id: parent_id).parent
        if parent.nil?
          parent = Comment.find_by id: parent_id
        end
        parent.children.build comment_params
      else
        Comment.new comment_params
      end
    end
  end
end
