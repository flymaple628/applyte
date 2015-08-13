# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	puts "country "
	Country.destroy_all
	puts "state"
	State.destroy_all
	puts "city"
	City.destroy_all
	puts "AutoCompelete"
	AutoCompelete.destroy_all

	Country.create(:name=>"USA")

	state_list = ['Florida', 'Georgia', 'Texas', 'New York', 'California', 'Indina', 'Massachusetts','Illinois']
	state_list.each_with_index do |st, index|
		State.create(:name=>st, :country_id=>Country.first)
	end

	city_list = [[1, 'Palo Alto',4],
							 [2,'West Lafayette',5],
							 [3, 'Cambridge',6],
							 [4, 'Chicago',7]]

	city_list.each_with_index do |ct, index|
		City.create(:name=>ct[1], :state_id=>ct[2])
	end

	puts "auto compelete"
	AutoCompelete.destroy_all

	autokey_list = ['','name','birthday','major','research_area','toefl','gre','publication','honor','research_experience','work_experience']

	autokey_list.each do |auto|
		AutoCompelete.create(:name=>auto)
	end
