class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.string :description
      t.integer :submitter, :null => false
      t.integer :sub_id, :null => false

      t.timestamps
    end
    add_index :links, :sub_id
    add_index :links, :submitter
  end
end
