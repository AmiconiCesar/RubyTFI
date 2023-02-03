class Schedule < ApplicationRecord
    validates :weekday, :start_time, :end_time,  presence: { message: "No puede ser nulo"}
    validates :start_time, comparison: { less_than: :end_time , 
        message: "debe ser anterior al Horario hasta" }
    
    enum weekday: [:Domingo, :Lunes, :Martes, :Miércoles, :Jueves, :Viernes, :Sábado]    

end
