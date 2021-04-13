class AddPositionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :position_id, :integer
    add_column :users, :description, :text
  end
end
