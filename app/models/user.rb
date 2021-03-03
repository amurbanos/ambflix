class User < ApplicationRecord
    has_one :location, dependent: :destroy
	has_secure_password   
end