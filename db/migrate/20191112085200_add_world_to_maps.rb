class AddWorldToMaps < ActiveRecord::Migration[5.2]
  def change
    add_reference :maps, :world, foreign_key: true
  end
end
