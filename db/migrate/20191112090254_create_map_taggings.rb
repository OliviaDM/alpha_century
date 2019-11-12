class CreateMapTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :map_taggings do |t|
      t.references :tag, foreign_key: true
      t.references :map, foreign_key: true

      t.timestamps
    end
  end
end
