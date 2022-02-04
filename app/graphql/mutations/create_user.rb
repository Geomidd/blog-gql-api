class Mutations::CreateUser < GraphQL::Schema::Mutation
  description "Create a user"
  null false
  type Types::UserType

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    User.create user.to_h
  end
end

