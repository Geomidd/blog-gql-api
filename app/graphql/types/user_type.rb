class Types::UserType < Types::BaseObject

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :country, String, null: true

  field :posts, [Types::PostType], null: true

end
