class CreateTimestamps < ActiveRecord::Migration[5.2]
  def change
    create_table :timestamps do |t|
      t.date :date
      t.references :card, foreign_key: true
      t.references :timestamp, foreign_key: true

      t.timestamps
    end
  end
end
