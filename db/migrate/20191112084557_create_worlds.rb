class CreateWorlds < ActiveRecord::Migration[5.2]
  def change
    create_table :worlds do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
