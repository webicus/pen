class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.integer :collection_id, :null => false #belongs to collection.
      t.string :title, :null => false
      t.string :description, :limit => 3000, :default => "", :null => false
      t.string :image_filename
      
      t.integer :sequence
      
      t.timestamps
    end
    
  end
  
  def self.down
    drop_table :styles
  end
end
