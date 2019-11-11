class CreateLinkFields < ActiveRecord::Migration[5.2]
  def change
    create_table :link_fields do |t|
      t.references :card_field, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
