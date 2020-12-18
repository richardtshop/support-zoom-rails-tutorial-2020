
# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_micropost, mutation: Mutations::CreateMicropost
  end
end
