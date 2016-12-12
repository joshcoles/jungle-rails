class User < ActiveRecord::Base

  has_secure_password

  has_many :orders
  has_many :reviews
  validates :email, uniqueness: true


  def name
    first_name + " " + last_name
  end


end
