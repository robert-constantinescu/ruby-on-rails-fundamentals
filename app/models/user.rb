class User < ApplicationRecord

  # the self.email is referencing each object of the User class,
  # so when it comes to the email field of any User, it will replace it with a downcase version
  before_save { self.email = email.downcase }
  has_many :reports

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX, message: 'not in valid format' }

end
