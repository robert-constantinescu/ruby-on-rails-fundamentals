# the '<' stands from inherits or is a subclass of
class Report < ApplicationRecord

  belongs_to :user
  has_many :report_categories
  has_many :categories, through: :report_categories

  # the below syntax adds a validation for the PRESENCE of the TITLE property => title must not be null
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

end
