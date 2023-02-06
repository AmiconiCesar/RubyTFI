class BankBranch < ApplicationRecord
    validates :name, :address, :phone, presence: { message: "No puede ser nulo"}
    validates :name, uniqueness: { message: "Ya existe esta Sucursal" }
    belongs_to :locality
    has_many :schedules
    has_many :turns 

    def to_string
        "#{name.capitalize} - #{locality.to_string}"
    end

end
