class RemoveCardAddTitleToMap < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :card_id
    add_column :maps, :title, :string
  end
end
