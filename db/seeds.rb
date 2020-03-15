# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.create(email: 'admin@nasnav.com', password: 'AdminAdmin', password_confirmation: 'AdminAdmin', name: 'Admin', phone_number: '0123456789', job_title: 'Admin')
puts = "1 Admin Created, Please login using #{admin.email}, and the password provided from the owner"

manager = OrganizationManager.create(email: 'manager@nasnav.com', password: 'ManagerManager', password_confirmation: 'ManagerManager', name: 'Manager', phone_number: '01234567890', job_title: 'Manager')
puts = "1 Admin Created, Please login using #{manager.email}, and the password provided from the owner"

token = AppToken.create(token: "a~rR-*Zd9t~H8wm@CmPd1", title: 'Nasnav_App_Token')
puts = 'APIs Token has been generated, please contact the owner to get access'
