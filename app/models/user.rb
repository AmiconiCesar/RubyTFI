class User < ApplicationRecord
    has_secure_password
    belongs_to :bank_branch, optional: true
    validates :username, presence: true, uniqueness: true, length: { in: 4..8 }, 
        format: { with: /\A[a-zA-Z0-9]+\z/, message: "Solo se permiten letras y números" }
    validates :password, length: { minimum: 4 }
    validate :bank_branch_required_for_personal    
    before_save :downcase_attibutes

    enum role: [:Administrador, :Cliente, :Personal]  

    private

    def downcase_attibutes
        self.username = username.downcase
    end   
    
    def bank_branch_required_for_personal
        if Personal? && bank_branch.nil?
          errors.add(:bank_branch, "Se requiere una Sucursal asociada para el Personal Bancario")
        end
    end

end
