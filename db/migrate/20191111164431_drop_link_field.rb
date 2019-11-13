class DropLinkField < ActiveRecord::Migration[5.2]
  def change
    drop_table :link_fields
  end
end
