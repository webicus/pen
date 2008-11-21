class Style < ActiveRecord::Base
  has_many :pens
  belongs_to :collection
end
