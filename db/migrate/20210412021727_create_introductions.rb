class CreateIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :introductions do |t|
      t.integer :position_id
      t.text :description
      t.references :user
      t.timestamps 
    end
  end
end
