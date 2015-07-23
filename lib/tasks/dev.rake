
namespace :dev do

	task :data => :environment do
		puts "Create User"
		User.destroy_all
		User.create!({:email => "guy@gmail.com",  :password => "12345678" })
		User.create!({:email => "ac5@gmail.com",  :password => "12345678" })
		user_id=User.first.id
		Address.destroy_all

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

		#profile

		puts "profile"
		Profile.destroy_all
		Experience.destroy_all
		Publication.destroy_all
		Honor.destroy_all

		profile_list={
		user_id: user_id,
		name: 'name',
    birthday: '',
    major: 'major',
    research_area: 'research',
    toefl_read: 5,
    toefl_listen: 5,
    toefl_speak: 5,
    toefl_write: 5,
    toefl_total: 5,
    gre_verbal: 5,
    gre_guantitatiue: 'guantita' ,
    gre_awa: 5,
    gre_total: 5
		}
		Profile.create(profile_list)
		profile_id=User.first.profile.id
		experience_list=[
			[1,1,'institude','title','',''],
			[1,3,'institude','title','',''],
			[1,5,'institude','title','',''],
			[1,7,'institude','title','',''],
			[1,9,'institude','title','','']
		]
		experience_list.each do |ex|
			puts "reaearch_experience: #{ex[3]}"
			experience={
			profile_id:profile_id,
    	serial: ex[1],
    	institude:ex[2],
    	title: ex[3],
    	date_from: Date.current,
    	date_to: Date.current,
    	etype: 'Research'
			}
			Experience.create(experience)
			experience={
			profile_id:profile_id,
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
				profile_id: profile_id,
    		serial: i,
    		title: "title#{i}",
    		url: "url#{i}"
			}
			Publication.create(publication)
		end

		puts "Honor"
		10.times do |i|

			puts "Honor: title#{i}"
			honor={
				profile_id: profile_id,
    		serial: i,
    		title: "title#{i}",
    		get_date: Date.current,
    		description: "description#{i}"
			}
			Honor.create(honor)
		end
		puts "user_program"
		UserProgramForm.destroy_all

		3.times do |i|
			puts "User_program: title#{i}"
			user_program_forms={
				user_id: user_id,
    		program_id: Program.order("RANDOM()").first().id
			}
			UserProgramForm.create(user_program_forms)
		end

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

