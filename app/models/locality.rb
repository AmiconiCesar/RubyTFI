class Locality < ApplicationRecord
    validates :name, :province, presence: { message: "Completar el campo nulo"}
    validates :name, uniqueness: { scope: :province, 
        message: "Ya existe esta Localidad" }
end
