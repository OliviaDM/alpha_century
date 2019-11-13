class CreateTextFields < ActiveRecord::Migration[5.2]
  def change
    create_table :text_fields do |t|
      t.references :card_field, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
