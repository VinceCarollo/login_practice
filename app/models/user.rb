class User < ApplicationRecord
  validates_presence_of :name, :email_address

  def user_exists?
    User.exists?(email_address: self.email_address.downcase)
  end

end
