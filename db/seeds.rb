# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = UserApp.create(first_name: "Alfredo", last_name: "Reyes", linkedin: "string", barcode_presentation_card: "string", presentation_card_front: "string", presentation_card_behind: "string", password: "123456", salt: "asd", email: "alfredo@rockstars.mx")