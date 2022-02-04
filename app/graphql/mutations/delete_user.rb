class Mutations::DeleteUser < GraphQL::Schema::Mutation
  description "Delete a user"
  null false
  type Boolean

  argument :id, ID, required: true

  def resolve(id:)
    User.where(id: id).destroy_all
    true
  end
end

