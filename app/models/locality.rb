class Locality < ApplicationRecord
    validates :name, :province, presence: { message: "No puede ser nulo"}
    validates :name, uniqueness: { scope: :province, 
        message: "Ya existe esta Localidad" }
end
