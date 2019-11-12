class DropCardField < ActiveRecord::Migration[5.2]
  def change
    drop_table :card_fields
  end
end
