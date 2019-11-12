class AddContentToCardField < ActiveRecord::Migration[5.2]
  def change
    add_column :card_fields, :content, :text
  end
end
