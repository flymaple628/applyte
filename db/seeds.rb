# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	puts "country state city"
	Country.destroy_all
	State.destroy_all
	City.destroy_all

	Country.create(:id=>1, :name=>"USA")

	state_list = ['Florida', 'Georgia', 'Texas', 'New York', 'California', 'Indina', 'Massachusetts','Illinois']
	state_list.each_with_index do |st, index|
		State.create(:id=>index, :name=>st, :country_id=>1)
	end

	city_list = [[1, 'Palo Alto',4],
							 [2,'West Lafayette',5],
							 [3, 'Cambridge',6],
							 [4, 'Chicago',7]]

	city_list.each_with_index do |ct, index|
		City.create(:id=>ct[0], :name=>ct[1], :state_id=>ct[2])
	end

	



