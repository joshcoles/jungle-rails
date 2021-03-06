class User < ActiveRecord::Base

  has_secure_password

  has_many :orders
  has_many :reviews
  validates :email, presence: true, uniqueness: { case_sensitive: false }, case_sensitive: false
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true, length: { minimum: 4 }

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    first_name + " " + last_name
  end

  def self.authenticate_with_credentials(email, password)
    stripped_email = email.strip unless email.nil?
    clean_email = stripped_email.downcase
    user = User.find_by(email: clean_email)
    user && user.authenticate(password)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
