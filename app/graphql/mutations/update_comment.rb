class Mutations::UpdateComment < GraphQL::Schema::Mutation
  description "Update a comment"
  null false
  type Boolean

  argument :comment, Types::CommentInputType, required: true

  def resolve(comment:)
    existing = Comment.where(id: comment[:id]).first
    existing&.update comment.to_h
  end
end

