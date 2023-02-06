class BankBranch < ApplicationRecord
    validates :name, :address, :phone, presence: { message: "No puede ser nulo"}
    validates :name, uniqueness: { message: "Ya existe esta Sucursal" }
    belongs_to :locality
    has_many :schedules, dependent: :destroy
    has_many :turns, dependent: :destroy
    
    def to_string
        "#{name.capitalize} - #{locality.to_string}"
    end

    def has_pending_turns?
        turns.where(state: :Pendiente).present? 
    end   
    
end
