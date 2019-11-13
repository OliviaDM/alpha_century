class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.references :card, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
