module UsersHelper

   
    def role_users 
        User.roles.keys     
    end   
    
    def bank_branches_all
        BankBranch.order(name: :asc)
    end

end
