class CreateEngravings < ActiveRecord::Migration
  def self.up
    create_table :engravings do |t|
      t.string :title, :default => ""
      t.string :image_filename
      
      t.integer :sequence
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :engravings
  end
end
