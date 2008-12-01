class Comment < ActiveRecord::Base
   # Validation
  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :email
end
