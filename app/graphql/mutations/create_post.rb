class Mutations::CreatePost < GraphQL::Schema::Mutation
  description "Create a post"
  null false
  type Types::PostType

  argument :post, Types::PostInputType, required: true

  def resolve(post:)
    user = User.where(id: post.user_id).first
    new_post = user.posts.build post.to_h
    new_post&.save
    new_post
  end
end

