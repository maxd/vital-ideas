class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.integer :idea_id
      t.string  :title
      t.text    :description
      t.integer :weight

      t.timestamps
    end

    add_index :features, :idea_id
  end

  def self.down
    drop_table :features
  end
end
