# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Locality.create( province: "Buenos Aires", name: "Saladillo")
Locality.create( province: "Salta", name: "Cafayate")
Locality.create( province: "Buenos Aires", name: "La Plata")

BankBranch.create( name: "SUC A", address: "Rivadavia 1500", phone: "256845858", locality_id: 1)
BankBranch.create( name: "SUC B", address: "Cochabamba 124", phone: "55628455", locality_id: 2)
BankBranch.create( name: "SUC C", address: "7 y 45", phone: "(221) 4215486 ", locality_id: 3)

Schedule.create( weekday: 1, start_time: "08:00", end_time: "13:00", bank_branch_id: 1) 
Schedule.create( weekday: 3, start_time: "07:30", end_time: "13:00", bank_branch_id: 1) 
Schedule.create( weekday: 5, start_time: "09:00", end_time: "12:00", bank_branch_id: 1) 
Schedule.create( weekday: 2, start_time: "07:00", end_time: "16:00", bank_branch_id: 2) 
Schedule.create( weekday: 4, start_time: "08:00", end_time: "13:30", bank_branch_id: 2) 
Schedule.create( weekday: 1, start_time: "09:00", end_time: "12:00", bank_branch_id: 3) 
Schedule.create( weekday: 4, start_time: "07:00", end_time: "12:30", bank_branch_id: 3) 

User.create(username: "admin", password: "admin", role: 0)
User.create(username: "staff1", password: "staff1", role: 2, bank_branch_id: 1)
User.create(username: "staff2",  password: "staff2", role: 2, bank_branch_id: 2)
User.create(username: "staff3",  password: "staff3", role: 2, bank_branch_id: 3)
User.create(username: "pedro", password: "pedro", role: 1)
User.create(username: "maria", password: "maria", role: 1)


Turn.create( date: "09-02-2022", time:"08:10", reason:"Apertura de cuenta", state: 0, bank_branch_id: 2, user_id: 5)
