class BankBranch < ApplicationRecord
    validates :name, :address, :phone, presence: { message: "No puede ser nulo"}
    validates :name, uniqueness: { message: "Ya existe esta Sucursal" }
end
