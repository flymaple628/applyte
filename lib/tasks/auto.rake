namespace :auto do

	task :data => :environment do
		autokey_list = ['','name','birthday','major','research_area','toefl','gre','publication','honor','research_experience','work_experience']

		autokey_list.each do |auto|
			AutoCompelete.create(:name=>auto)
		end
	end
end