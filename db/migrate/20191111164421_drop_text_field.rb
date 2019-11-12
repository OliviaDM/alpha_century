class DropTextField < ActiveRecord::Migration[5.2]
  def change
    drop_table :text_fields
  end
end
