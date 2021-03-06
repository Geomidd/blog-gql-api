module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: false,
      description: "Return an instance of User type" do
      argument :id, ID, required: true
    end
    def user(id:)
      User.where(id: id).first
    end

    field :users, [Types::UserType], null: false,
          description: "Return an array of User types"
    def users
      User.all
    end

    field :post, Types::PostType, {null: false, description: "Return an instance of Post type"} do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.where(id: id).first
    end

    field :posts, [Types::PostType], null: false,
          description: "Return an array of Post types"
    def posts
      Post.all
    end

    field :comment, Types::CommentType, {null: false, description: "Return an instance of Comment type"} do
      argument :id, ID, required: true
    end
    def comment(id:)
      Comment.where(id: id).first
    end

    field :comments, [Types::PostType], null: false,
          description: "Return an array of Comment types"
    def comments
      Comment.all
    end
  end
end
