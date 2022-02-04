class Mutations::DeletePost < GraphQL::Schema::Mutation
  description "Delete a post"
  null false
  type Boolean

  argument :id, ID, required: true

  def resolve(id:)
    Post.where(id: id).destroy_all
    true
  end
end

