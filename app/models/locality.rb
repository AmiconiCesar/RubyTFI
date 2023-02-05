class Locality < ApplicationRecord
    validates :name, :province, presence: { message: "No puede ser nulo"}
    validates :name, uniqueness: { scope: :province, 
        message: "Ya existe esta Localidad" }
    has_many :bank_branches
      
    def to_string
        "#{province} - #{name}"
    end
end
