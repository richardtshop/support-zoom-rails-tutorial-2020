module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :microposts, Types::MicropostType.connection_type, null: true
    field :microposts_count, Integer, null: true
  end
end
