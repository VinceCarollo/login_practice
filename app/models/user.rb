class User < ApplicationRecord
  validates_presence_of :name, :email_address, :password

  def self.authenticate(email, password)
    user = User.find_by(email_address: email)
    user && user.password == password
  end

  def user_exists?
    User.exists?(email_address: self.email_address.downcase)
  end

end
