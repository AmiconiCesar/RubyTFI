class User < ApplicationRecord
    has_secure_password
    
    validates :username, presence: true, uniqueness: true, length: { in: 4..8 }, 
        format: { with: /\A[a-zA-Z0-9]+\z/, message: "Solo se permiten letras y números" }
    validates :password, length: { minimum: 4 }

    before_save :downcase_attibutes

    enum role: [:Administrador, :Cliente, :Personal]  

    private

    def downcase_attibutes
        self.username = username.downcase
    end    

end
