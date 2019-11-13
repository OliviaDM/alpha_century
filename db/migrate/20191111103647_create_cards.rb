class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.boolean :is_map

      t.timestamps
    end
  end
end
