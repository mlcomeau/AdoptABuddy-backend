class User < ApplicationRecord
    has_secure_password
    has_many :searches

    validates :email, uniqueness: true 

    validates :name, :email, :zipcode, :search_radius, presence: true 

    validates :zipcode, :search_radius, numericality: { only_integer: true }

end
