class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.references :card, foreign_key: true
      t.references :map, foreign_key: true
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
