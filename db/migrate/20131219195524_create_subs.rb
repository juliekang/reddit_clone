class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :name, :null => false
      t.integer :moderator, :null => false

      t.timestamps
    end
    add_index :subs, :name, :unique => true
    add_index :subs, :moderator
  end
end
