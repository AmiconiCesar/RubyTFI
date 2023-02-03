class Schedule < ApplicationRecord
    validates :weekday, :start_time, :end_time,  presence: { message: "No puede ser nulo"}
    validates :start_time, comparison: { less_than: :end_time , 
        message: "debe ser anterior al Horario hasta" }
    validates :weekday, uniqueness: { scope: :bank_branch_id, 
            message: "Ya está definido este día en esta Sucursal" }
            
    belongs_to :bank_branch
    
    enum weekday: [:Domingo, :Lunes, :Martes, :Miércoles, :Jueves, :Viernes, :Sábado]    

end
