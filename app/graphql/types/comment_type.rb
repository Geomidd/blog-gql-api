class Types::CommentType < Types::BaseObject

  field :id, ID, null: false
  field :body, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime,null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime,null: false

  field :post, Types::PostType, null: false

end

class Types::CommentInputType < GraphQL::Schema::InputObject
  graphql_name "CommentInputType"
  description "All the attributes needed to create/update a comment"

  argument :id, ID, required: false
  argument :post_id, ID, required: false
  argument :body, String, required: false

end
