class User < ApplicationRecord
    has_secure_password

    validates :email, uniqueness: true 

    validates :name, :email, :zipcode, :search_radius, presence: true 

    validates :zipcode, :search_radius, numericality: { only_integer: true }

end
