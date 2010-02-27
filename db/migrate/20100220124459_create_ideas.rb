class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.integer :id
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :target, :null => false
      t.text :description
      t.integer :state_id, :null => false
      t.boolean :public, :default => false
      t.boolean :sticky, :default => false

      t.timestamps
    end

    add_index :ideas, :user_id
  end

  def self.down
    drop_table :ideas
  end
end
