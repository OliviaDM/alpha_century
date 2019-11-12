class ChangeWorldImageToPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_column :worlds, :image, :photo
  end
end
