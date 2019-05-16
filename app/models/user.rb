class User < ApplicationRecord
  validates_presence_of :name, :email_address
end
