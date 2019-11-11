class CreateImageFields < ActiveRecord::Migration[5.2]
  def change
    create_table :image_fields do |t|
      t.references :card_field, foreign_key: true
      t.string :image_url
      t.string :image_title

      t.timestamps
    end
  end
end
