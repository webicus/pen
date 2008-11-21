class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.string :title, :null => false
      t.string :description, :limit => 3000, :default => "", :null => false
      t.string :image_filename
      
      t.integer :sequence
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :collections
  end
end
