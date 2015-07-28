require 'rails_helper'
describe "#association" do
  before(:all) do

    @address={
     :address1=>'Stanford University 450 Serra Mall Stanford, CA 94305–2004' ,
     :address2=>'',
     :city_id=>City.first.id,
     :state_id=>State.first.id,
     :country_id=>Country.first.id,
     :addressable_id=>"1",
     :addressable_type=>"School",
     :postal_code=>'94305–2004'
   }
   @school = {
     :name=>"name",
     :campus=>"campus",
     :desc=>"desc",
     :phone=>"phone",
     :email=>"email"
   }
   @program = {
     :title=>"title",
     :degree=>"degree",
     :level=>"level",
     :desc=>"desc",
     :department=>"department",
     :fax=>"fax",
     :phone=>"phone",
     :email=>"email"
   }
	end
  context "when have a address city cant be delete " do
		it "should get error " do
			school=School.create(@school).build_address(@address)
      city=City.first
      expect(City.first.destroy()).to eq(city)
    end

  end



end
