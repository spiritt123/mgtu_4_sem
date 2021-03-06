class User < ApplicationRecord
  has_secure_password
  #validates :name
  #validates :rights
  #validates :iduser, presence: true, uiqueness: true
end
