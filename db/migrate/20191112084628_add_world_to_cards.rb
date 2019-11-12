class AddWorldToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :world, foreign_key: true
    remove_column :cards, :user_id
  end
end
