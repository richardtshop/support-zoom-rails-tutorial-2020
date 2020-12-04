
# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # First describe the field signature:
    field :microposts, [MicropostType], null: true do
      description "Find all posts"
      argument :limit, Int, required: false
    end

    # Then provide an implementation:
    def microposts(limit:-1)
      if limit == -1
        Micropost.all
      else
        Micropost.order(:created_at).take(limit)
      end
    end

    field :micropost, MicropostType, null: true do
      description "Find a post by ID"
      argument :id, ID, required: true
    end

    def micropost(id:)
      Micropost.find(id)
    end
  end
end
