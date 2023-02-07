module BankBranchesHelper

    def bank_branches_available
       BankBranch.joins(:schedules).where("schedules.id IS NOT NULL").distinct.order(name: :asc)
    end   
    
    def ordered_localities 
        Locality.order(province: :asc , name: :asc)
    end    

end
