class User < ApplicationRecord
    has_many :addresses
    has_many :favorites 
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
end
