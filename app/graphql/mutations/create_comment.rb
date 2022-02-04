class Mutations::CreateComment < GraphQL::Schema::Mutation
  description "Create a comment"
  null false
  type Types::CommentType

  argument :comment, Types::CommentInputType, required: true

  def resolve(comment:)
    post = Post.where(id: comment.post_id).first
    new_comment = post.comments.build comment.to_h
    new_comment&.save
    new_comment
  end
end

