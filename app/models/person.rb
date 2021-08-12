class Person < ApplicationRecord

  # this is used to form the ONE-TO-MANY associations with the Article model
  has_many :articles

end
