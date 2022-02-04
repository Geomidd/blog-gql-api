class Types::UserType < Types::BaseObject
  description "A user object"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :country, String, null: true

  field :full_name, String, null: true
  field :posts, [Types::PostType], null: true

  # Errors
  field :errors, [Types::ErrorType], null:true
  def errors
    object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
  end
end

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "All the attributes needed to create/update a user"

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :country, String, required: false

end
