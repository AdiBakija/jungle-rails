class User < ActiveRecord::Base

before_validation :email_validation

  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  private

  def email_validation
    self.email = email.downcase
    self.email = email.gsub(/\s+/, "")
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
  end

end
