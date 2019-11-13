class DropImageField < ActiveRecord::Migration[5.2]
  def change
    drop_table :image_fields
  end
end
