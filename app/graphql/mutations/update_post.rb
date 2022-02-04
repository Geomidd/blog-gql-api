class Mutations::UpdatePost < GraphQL::Schema::Mutation
  description "Update a post"
  null false
  type Boolean

  argument :post, Types::PostInputType, required: true

  def resolve(post:)
    existing = Post.where(id: post[:id]).first
    existing&.update post.to_h
  end
end

