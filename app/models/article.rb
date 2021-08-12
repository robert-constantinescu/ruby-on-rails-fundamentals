class Article < ApplicationRecord

  #this is used to form the ONE-TO-MANY associations with the Person model
  belongs_to :person

  # the below syntax adds a validation for the PRESENCE of the TITLE property => title must not be null
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
