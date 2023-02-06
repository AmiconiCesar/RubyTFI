class Turn < ApplicationRecord
    validates :date, :time, :reason, :state, presence: { message: "No puede ser nulo"}
    validate  :date_and_time
    attribute :state, :integer, default: 0        
    belongs_to :bank_branch
    
    enum state: [:Pendiente, :Atendido, :NoAtendido]   
   
    
    def date_and_time
        if date_valid?    
            schedule = bank_branch.schedules.where(weekday: date.wday).first
            weekdays = bank_branch.schedules.order(:weekday).pluck(:weekday)
            if schedule.nil?
            errors.add(:date, "La Sucursal Bancaria solo atiende los días #{weekdays.join(', ')}")
            elsif schedule.start_time > time || schedule.end_time < time
            errors.add(:time, "La Sucursal Bancaria atiende entre las
                #{schedule.start_time.strftime("%H:%M")}
                y las #{schedule.end_time.strftime("%H:%M")} hs.") 
            end 
        else
           errors.add(:date, "La fecha seleccionada es anterior al día de hoy")
        end          
    end

    def date_valid?
        date >= Date.today 
    end
end
