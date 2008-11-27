class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types do |t|
      t.string :title, :default => ""
      t.integer :sequence
      t.timestamps
    end
  end
  
  def self.down
    drop_table :types
  end
end
