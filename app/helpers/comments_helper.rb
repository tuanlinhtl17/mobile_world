module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment|
      content_tag(:div, render(comment) + 
      (comment.children.size > 0 ? content_tag(:div, comments_tree_for(comment.children.order(created_at: :asc).first(2)),
      class: "replies") : nil) + (comment.children.size > 2 ? content_tag(:a, t("views.comments.comment.load_more_comment"),
      onclick: 'show_children(this)', class: "replies", id: comment.id) : ""),
      class: "comment-section-#{comment.id}")
    end.join.html_safe
  end
end
