class AddContentToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :content, :text
  end
end
