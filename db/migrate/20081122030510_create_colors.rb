class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.string :title
      t.string :image_filename
      
      t.integer :sequence
      t.timestamps
    end
  end

  def self.down
    drop_table :colors
  end
end
