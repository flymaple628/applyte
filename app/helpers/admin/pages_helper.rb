module Admin::PagesHelper

	def setup_program(program)
		program.build_address unless program.address
		program
	end

end
