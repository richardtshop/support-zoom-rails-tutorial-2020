module Types
  class MicropostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :tag, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: false, # Fields can return other objects:
    description: "This post's author." # And fields can have their own descriptions:
    field :user_id, Integer, null: false
  end
end
