
namespace :dev do
	# task :profolio => :environment do
	# 	Profolio.destroy_all
	# 	Experience.destroy_all
	# 	Publication.destroy_all
	# 	Honor.destroy_all
	# 	User.destroy_all

	# 	profolio_list={
	# 	user_id: 1,
	# 	name: 'name',
 #    birthday: '',
 #    major: 'major',
 #    research_area: 'research',
 #    toefl_read: 5,
 #    toefl_listen: 5,
 #    toefl_speak: 5,
 #    toefl_write: 5,
 #    toefl_total: 5,
 #    gre_verbal: 5,
 #    gre_guantitatiue: 'guantita' ,
 #    gre_awa: 5,
 #    gre_total: 5
	# 	}
	# 	Profolio.create(profolio_list)
	# 	experience_list=[
	# 		[1,1,'title1','','description1'],
	# 		[1,2,'title2','','description1'],
	# 		[1,3,'title3','','description1'],
	# 		[1,4,'title4','','description1'],
	# 		[1,5,'title5','','description1'],
	# 	]
	# 	experience_list.each do |ex|
	# 		experience={
	# 		user_id:ex[0],
 #    	serial: 1
 #    	title: 'fdsfdsfdsfds'
 #    	get_date: ''
 #    	description: 'dfdsfsdfwewerew'
	# 	}
	# 	end
	# 	Experience.create
	# end
	task :data => :environment do
		User.destroy_all
		User.create!({:email => "ac5@gmail.com",  :password => "12345678" })
		Address.destroy_all

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

		puts "school"
		School.destroy_all

		school_list = [[1, 1, 'Stanford', 'Stanford campus','1 650-723-2300', 'aa@Stanford.edu',     '450 Serra Mall, Stanford, CA 94305',				 'http://collegeapps.about.com/od/collegeprofiles/p/Stanford_profil.htm', "Stanford University is one of the world's leading research and teaching institutions. It is located in Stanford, California."],
									 [2, 2, 'purdue',   'purdue campus',  '(765) 494-4600', 'online@purdue.edu',   'Purdue University, 610 Purdue Mall, West Lafayette, IN 47907', 		'http://collegeapps.about.com/od/collegeprofiles/p/purdue_main.htm', "History. Traditions. Achievements. The Boilermaker story is full of milestones that have had a significant impact on our state, nation and world. See for yourself how Purdue fulfills its mission."],
									 [3, 3, 'Harvard',  'Harvard campus', '617.495.1000',   'online@harvard.edu',  'Massachusetts Hall Cambridge, MA 02138', 			'http://www.harvard.edu/about-harvard',"Harvard University is devoted to excellence in teaching, learning, and research, and to developing leaders in many disciplines who make a difference globally. Harvard faculty are engaged with teaching and research to push the boundaries of hum..."],
									 [4, 3, 'MIT',	    'MIT campus', 	  '617.253.1000',   'online@mit.edu',      '77 Massachusetts Ave, Cambridge, MA 02139', 		'http://web.mit.edu/aboutmit/', "The mission of MIT is to advance knowledge and educate students in science, technology and other areas of scholarship that will best serve the nation and the world in the 21st century — whether the focus is cancer, energy, economics or literature (learn more about MIT's current initiatives)."],
									 [5, 4, 'Chicago',  'Chicago campus', '773.702.1234',   'online@chicago.edu',  'Stanford University 450 Serra Mall Stanford, CA 94305–2004.', 'http://www.uchicago.edu/about/', "One of the world's premier academic and research institutions, the University of Chicago has driven new ways of thinking since our 1890 founding. Today, UChicago is an intellectual destination that draws inspired scholars to our Hyde Park and international campuses, keeping UChicago at the nexus of ideas that challenge and change the world."]]

		school_list.each_with_index do |s,index|
			sc = School.new
			sc.id = s[0]
			sc.name = s[2]
			sc.campus = s[3]
			sc.desc = s[8]
			sc.phone = s[4]
			sc.email = s[5]
			sc.link_name = s[2]
			sc.link_url = s[7]

			ct = City.find s[1]


			addr = Address.new
			addr.address1 = s[6]
			addr.city_id = ct.id
			addr.state_id = ct.state_id
			addr.country_id = 1
			sc.address= addr

			sc.save!
		end



		AreaCategory.destroy_all
		area_categories = ["Science", "Education", "Engineering"]

		area_categories.each_with_index do |ac,index|
			AreaCategory.create(:id=>index, :name=>ac)
		end

		degree = ["graduate,master"]

#program for every schools
puts "program for every school"
		Program.destroy_all
		Area.destroy_all
		AreaCategory.destroy_all
		AreaToAreaCategory.destroy_all

		programs = [[2, "Chemical Engineering", "Eng department", "CheE", ['number','business','atnomic']],
								[2, "Computer Engineering", "Eng department", "CE", ['code','business','embedded']],
								[2, "Electrical Engineering", "Eng department", "EE", ['communication','machincal','chip']],
								[1, "Elementary Education", "Edu department", "EEdu", ['math','eng','social','physics']],
								[1, "Social Studies Education", "Edu department", "Soc", ['nation','human','history']],
								[0, "Chemistry", "Science department", "CheS", ['theory','business','che']],
								[0, "Computer Science", "Science department", "CS",['code','theory','Electrical']],
								[0, "Genetic Biology", "Science department", "GB", ['theory','insect','medical']]]



		School.all.each do |sc|

			puts "school: #{sc.name}"

			programs.each_with_index do |p, index|

				pg = sc.programs.new
				pg.name = p[1]
				pg.desc = Faker::Lorem.paragraph(2)
				pg.degree = degree[rand(1)]
				pg.level = rand(3)
				pg.department = p[1]
				pg.phone = sc.phone
				pg.email = sc.email
				pg.build_address
				pg.address.address1 = sc.address.address1
				pg.address.city_id = sc.address.city_id

				puts "#{p} #{index} #{sc}"

				(rand(5)+2).times do |t|
					area = pg.areas.new(:name => "#{p[3]} #{t}")

					p[4].each do |area_category|
						if rand(2) ==1
							area.area_categories.new(:name=> area_category)
						end
					end
				end
				pg.save
			end
			
		end

	end
end

