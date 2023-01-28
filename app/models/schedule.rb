class Schedule < ApplicationRecord
    validates :weekday, :start_time, :end_time,  presence: { message: "No puede ser nulo"}
    validates :weekday, uniqueness: { message: "Ya existe este día de la semana"}
end
