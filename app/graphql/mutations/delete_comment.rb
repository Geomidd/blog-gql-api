class Mutations::DeleteComment < GraphQL::Schema::Mutation
  description "Delete a comment"
  null false
  type Boolean

  argument :id, ID, required: true

  def resolve(id:)
    Comment.where(id: id).destroy_all
    true
  end
end

