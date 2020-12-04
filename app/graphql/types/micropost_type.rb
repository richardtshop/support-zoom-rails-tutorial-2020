module Types
  class MicropostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    # Fields can return other objects:
    field :user, Types::UserType, null: false,
      # And fields can have their own descriptions:
      description: "This post's author."
  end
end
