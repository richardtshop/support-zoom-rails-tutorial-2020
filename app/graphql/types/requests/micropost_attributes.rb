module Types
  class Requests::MicropostAttributes < Types::BaseInputObject
    description 'arguments for micropost'

    argument :content, String, required: true
    argument :user_id, ID, required: true
    argument :tag, String, required: false
  end
end
