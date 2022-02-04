class Types::PostType < Types::BaseObject

  field :id, ID, null: false
  field :body, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime,null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime,null: false

  field :user, Types::UserType, null: false
  field :comments, [Types::CommentType], null: false

end

class Types::PostInputType < GraphQL::Schema::InputObject
  graphql_name "PostInputType"
  description "All the attributes needed to create/update a post"

  argument :id, ID, required: false
  argument :user_id, ID, required: false
  argument :body, String, required: false

end
