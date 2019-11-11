class CreateCardFields < ActiveRecord::Migration[5.2]
  def change
    create_table :card_fields do |t|
      t.references :card, foreign_key: true
      t.integer :order
      t.string :type

      t.timestamps
    end
  end
end
