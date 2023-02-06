class Locality < ApplicationRecord
    validates :name, :province, presence: { message: "No puede ser nulo"}
    validates :name, uniqueness: { scope: :province, 
        message: "Ya existe esta Localidad" }
    has_many :bank_branches
    validate :no_branches_associated, on: :destroy
      
    def to_string
        "#{province} - #{name}"
    end

    def no_branches_associated
        if bank_branches.any?
            errors.add(:base, "Existen Sucursales Bancarias asociadas a esta Localidad")
            throw :abort
        end
    end

end
