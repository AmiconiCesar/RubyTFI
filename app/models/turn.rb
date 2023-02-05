class Turn < ApplicationRecord
    validates :date, :time, :reason, :state, presence: { message: "No puede ser nulo"}
    #validates :start_time, comparison: { less_than: :end_time , 
    #    message: "debe ser anterior al Horario hasta" }
    #validates :weekday, uniqueness: { scope: :bank_branch_id, 
    #        message: "Ya está definido este día en esta Sucursal" }
    attribute :state, :integer, default: 0        
    belongs_to :bank_branch
    
    enum state: [:Pendiente, :Atendido, :NoAtendido]   

end
