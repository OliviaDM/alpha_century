class AddIsEventToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :is_event, :boolean
  end
end
