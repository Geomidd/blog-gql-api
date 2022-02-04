class Mutations::UpdateUser < GraphQL::Schema::Mutation
  description "Update a user"
  null false
  type Boolean

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    existing = User.where(id: user[:id]).first
    existing&.update user.to_h
  end
end

