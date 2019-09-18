# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.create(username: "drwho", password: "tardis", first_name: "No One", last_name: "Knows", admin: false)
Doctor.create(username: "drsuess", password: "redfish", first_name: "Henry", last_name: "Spencer", admin: true)

Patient.create(email: "joe@sample.com", password: "password", first_name: "Joe", last_name: "Smith", birthday: "1999-10-10", allergies: "none")

@sched_1 = DocSched.create(date: Date.today, shift_start: "08:00:00", shift_end: "14:00:00", doctor_id: 1)
@sched_2 = DocSched.create(date: Date.today, shift_start: "11:00:00", shift_end: "17:00:00", doctor_id: 2)

@sched_1.make_appointments
@sched_2.make_appointments
