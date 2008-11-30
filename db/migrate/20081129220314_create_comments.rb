class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.integer :type_id
      t.integer :color_id
      t.integer :style_id      
      t.column :inquiry, :string, :limit => 600, :default => "", :null => false
      t.integer :captcha
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comments
  end
end
