class ChangeImageUrlToPhotoInMaps < ActiveRecord::Migration[5.2]
  def change
    rename_column :maps, :image_url, :photo
  end
end
