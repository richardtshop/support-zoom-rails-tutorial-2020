module Mutations
  class CreateMicropost < BaseMutation
    field :post, Types::MicropostType, null:false
    field :errors, [String], null:false

    argument :micropost_request, Types::Requests::MicropostAttributes, required: true

   def resolve(micropost_request:)
     user = User.find(micropost_request.user_id)
     micropost = Micropost.new(
       content: micropost_request.content,
     )

     micropost.user = user

     if micropost.save!
       {
         micropost: micropost,
         errors: []
       }
     else
       {
        micropost: nil,
         errors: micropost.errors.full_messages
       }
     end
   end
  end
end
