class AddTagsToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :tag, :string
  end
end
