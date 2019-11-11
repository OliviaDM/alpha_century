class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :card_fields, :type, :content_type
  end
end
