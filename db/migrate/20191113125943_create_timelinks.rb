class CreateTimelinks < ActiveRecord::Migration[5.2]
  def change
    create_table :timelinks do |t|
      t.references :parent_event, foreign_key: { to_table: :cards }
      t.references :child_event, foreign_key: { to_table: :cards }

      t.timestamps
    end
  end
end
