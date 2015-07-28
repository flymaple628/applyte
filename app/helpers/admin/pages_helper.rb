module Admin::PagesHelper

	def setup_program(program)
		program.build_address unless program.address
		program
	end

	def setup_school(school)
		school.build_address unless school.address
		school.build_logo unless school.logo
		school
	end

end
