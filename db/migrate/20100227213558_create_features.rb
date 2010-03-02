class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.integer :idea_id, :null => false
      t.string  :title, :null => false
      t.text    :description
      t.integer :weight, :default => 0

      t.timestamps
    end

    add_index :features, :idea_id
  end

  def self.down
    drop_table :features
  end
end
