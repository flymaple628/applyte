
namespace :dev do

	task :remove_all => :environment do
		School.destroy_all
		Program.destroy_all
		
	end

	task :data => :environment do
		puts "Create User"
		user_list = [["guy@gmail.com", "guy"],
						 		 ["acc@gmail.com", "acc"],
						 		 ["alumni1@gmail.com", "alumni1"],
						 		 ["alumni2@gmail.com", "alumni2"],
						 		 ["alumni3@gmail.com", "alumni3"],
						 		 ["alumni4@gmail.com", "alumni4"],
						 		 ["alumni5@gmail.com", "alumni5"],
						 		 ["alumni6@gmail.com", "alumni6"],
						 		 ["alumni7@gmail.com", "alumni7"],
						 		 ["alumni8@gmail.com", "alumni8"],
						 		 ["alumni9@gmail.com", "alumni9"]]

		user_list.each do |u|
			user = User.find_by_email(u[0])
			unless user
				User.create!(:email=>u[0], :username=>u[1], :password=>"12345678")
			end
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

		ProgramCategory.destroy_all
		puts "program category"
		program_categories = [[1, "Chemical Engineering"],
													[2, "Electrical Engineering"],
													[3, "Social Studies Education"],
													[4, "Computer Science"],
													[5, "Genetic Biology"]]
		program_categories.each do |pc|
			ProgramCategory.create(:id=> pc[0],:name=>pc[1])
		end

#program for every school
puts "program for every school"
		Program.destroy_all
		Area.destroy_all
		AreaCategory.destroy_all
		AreaToAreaCategory.destroy_all

		degree = ["graduate","master"]

		programs = [[2, 1, "Eng department", "CheE", ['number','business','atnomic']],
								[2, 2, "Eng department", "CE", ['code','business','embedded']],
								[2, 3, "Eng department", "EE", ['communication','machincal','chip']],
								[1, 4, "Edu department", "EEdu", ['math','eng','social','physics']],
								[1, 5, "Edu department", "Soc", ['nation','human','history']],
								[0, 6, "Science department", "CheS", ['theory','business','che']],
								[0, 7, "Science department", "CS",['code','theory','Electrical']],
								[0, 8, "Science department", "GB", ['theory','insect','medical']]]

		pg_photos =	Dir.glob("public/example_pic/school/*")			

		School.all.each do |sc|

			puts "school: #{sc.name}"
			programs.each_with_index do |p, index|

				pg = sc.programs.new
				pg.program_category_id = p[1]
				pg.title = "#{sc.name} #{p[2]}"
				pg.desc = "#{pg.title} belongs to #{sc.desc}"
				pg.degree = degree[rand(1)]
				pg.level = rand(3)
				pg.department = p[1]
				pg.phone = sc.phone
				pg.email = sc.email
				pg.ranking = rand(20)+1
				pg.tuition = rand(200)*100 +10000
				pg.deadline = Faker::Date.between(Date.new(2015,10,10),Date.new(2015,12,10))
				pg.build_address
				pg.address.address1 = sc.address.address1
				pg.address.city_id = sc.address.city_id

				puts 'program pictures'
				4.times do |t|
					pic = pg_photos[rand(pg_photos.count)]
					pg.photos.new(:photo=>File.open(Dir.glob(pic)[0]))
				end

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


		puts "faculty"
		Faculty.destroy_all
		Program.all.each do |pg|
			name = Faker::Name.name
			email = "#{name}@#{pg.school.name}"
			desc = Faker::Lorem.sentences
			

		end



		#profile

		puts "profile"
		Profile.destroy_all
		Experience.destroy_all
		Publication.destroy_all
		Honor.destroy_all

		User.all.each do |u|
			profile_list={
			user_id: u.id,
			name: 'name',
	    birthday: '',
	    major: 'major',
	    research_area: 'research',
	    toefl_read: rand(30),
	    toefl_listen: rand(30),
	    toefl_speak: rand(30),
	    toefl_write: rand(30),
	    toefl_total: rand(30),
	    gre_verbal: rand(30),
	    gre_guantitatiue: 'guantita' ,
	    gre_awa: rand(30),
	    gre_total: rand(30)
			}
			pr = Profile.create(profile_list)
			experience_list=[
				[1,1,'institude-value 1','title-1','',''],
				[1,3,'institude-value 2','title-2','',''],
				[1,5,'institude-value 3','title-3','',''],
				[1,7,'institude-value 4','title-4','',''],
				[1,9,'institude-value 5','title-5','','']
			]
			experience_list.each do |ex|
				puts "reaearch_experience: #{ex[3]}"
				experience={
					profile_id: pr.id,
		    	serial: ex[1],
		    	institude:ex[2],
		    	title: ex[3],
		    	date_from: Date.current,
		    	date_to: Date.current,
		    	etype: 'Research'
				}
				Experience.create(experience)
				experience={
					profile_id: pr.id,
		    	serial: ex[1]+1,
		    	institude:ex[2],
		    	title: ex[3],
		    	date_from: Date.current,
		    	date_to: Date.current,
		    	etype: 'Work'
				}
				Experience.create(experience)
			end

			puts "Publication"
			10.times do |i|

				puts "Publication: title#{i}"
				publication={
					profile_id: pr.id,
	    		serial: i,
	    		title: "publication title#{i}",
	    		url: "publication url#{i}"
				}
				Publication.create(publication)
			end

			puts "Honor"
			10.times do |i|

				puts "Honor: title#{i}"
				honor={
					profile_id: pr.id,
	    		serial: i,
	    		title: "honor-title-value #{i}",
	    		get_date: Date.current,
	    		description: "honor-description#{i}"
				}
				Honor.create(honor)
			end
		end

		puts "user_program"
		UserProgramForm.destroy_all

		3.times do |i|
			puts "User_program: title#{i}"
			User.all.each do |u|
				user_program_forms={
					user_id: u.id,
	    		program_id: Program.order("RANDOM()").first().id
				}
				UserProgramForm.create(user_program_forms)
			end
		end

		puts "Alumn"
		user_alumni_list = []
		User.all.each do |u|
			if u.email.include?("alumni")
				user_alumni_list << u.id
			end
		end

		Alumn.destroy_all
		user_alumni_list.each do |user|
			Program.all.each do |pg|
				if rand(5)>3
				alumns={
			    profile_id: User.find(user).profile.id,
			    program_degree: "alumni program_degree value",
			    program_year: 2015,
			    admission: "alumni admission value",
			    background: "alumni background value",
			    recommendation: "alumni recommendation value",
			    description: "alumni description value",
				}
				Alumn.create(alumns)
				end
			end
		end

		puts "ProgramAlumnship"
		ProgramAlumnship.destroy_all
		Alumn.all.each do |al|
			Program.all.each do |pg|
				if rand(4) >1
					ProgramAlumnship.create(program_id: pg.id, alumn_id: al.id)
				end
			end
		end

		puts "Program_areaships"

		ProgramAreaship.destroy_all
		program_areas={
			program_id: Program.first.id,
    	area_id: Area.first.id
		}

		ProgramAreaship.create(program_areas)


		puts "program form key"
		ProgramFormKey.destroy_all
		program_keys = [["first name",1,"string"],
										["middle name",1,"string"],
										["last name",1,"string"],
										["preferred name",1,"string"],
										["Are you Hispanic or Latino?",2,"boolean"],
										["United States Military or Veteran Status",3,"string"],
										["address1",4,"string"],
										["city",4,"string"],
										["phone",4,"string"],
										["program",5,"string"],
										["Educational History",6,"text"],
										["Test Information",6,"text"],
										["Application Information",6,"text"],
										["Financial Aid",6,"text"],
										["Employment History & Languages",6,"text"],
										["Supplemental Information",6,"text"],
										["Register Your References",6,"text"],
										["Document Uploads, Confirmation & Submission",6,"text"],
										["GRE",7,"integer"],
										["TOEFL",7,"integer"],
										["Statement of Purpose",8,"text"],
										["Letters of Recommendation",8,"text"],
										["Transcripts (Academic Records)",8,"text"]]

			ProgramFormKey.destroy_all
      Program.all.each_with_index do |pg,index|
      	program_keys.each_with_index do |pgk,i|
	      	pg.program_form_keys.create(
	      				:name=>pgk[0],
	      				:program_form_key_category_id=>pgk[1],
	      				:key_type=>pgk[2])

      	end
      end
	end
end

