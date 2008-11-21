class CreatePens < ActiveRecord::Migration
  def self.up
    create_table :pens do |t|
      t.integer :style_id
      t.string :image_filename
      
      t.integer :sequence
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pens
  end
end
