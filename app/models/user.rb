class User < ApplicationRecord
	has_secure_password

    validates :username, uniqueness: true
    validates(:password, { :length => { :in => 4..8 } })
	validates :username, :email, presence: true
end



