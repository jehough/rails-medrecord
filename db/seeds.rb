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
