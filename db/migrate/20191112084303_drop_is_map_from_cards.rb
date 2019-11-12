class DropIsMapFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :is_map
  end
end
