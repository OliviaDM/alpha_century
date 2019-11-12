class AddWorldToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :world, foreign_key: true
    remove_column :tags, :user_id
  end
end
