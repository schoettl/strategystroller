# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

puts "****************\n The seed file is being run now. \n****************"

AdminUser.create(
    :email => 'admin@example.com',
    :password => 'password',
    :password_confirmation => 'password'
)

cu = User.new(
    :email => 'cu@example.com',
    :password => 'password',
    :business_code => 'A1',
    :password_confirmation => 'password',
    :controlling_unit => true
)
cu.skip_confirmation!
cu.save

puts "****************\n The seed file has been run. \n****************"
