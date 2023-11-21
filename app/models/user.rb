class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  # Other validations you might need...

  # Optional: If you want to format the email to be lowercase before saving
  before_save { self.email = email.downcase }
end
