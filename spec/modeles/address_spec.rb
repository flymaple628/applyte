require 'rails_helper'
describe "#association" do
  before(:each) do
   # @state = State.create!( :name=>'San-Jose', :country_id=>country.first.id )
   # @city = City.create!( :name=>'Palo-Alto', :state_id=>state.id )

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
  context "when Address be Polymorphic Associations" do
		it "should get type school " do
			school=School.create(@school).build_address(@address)

      expect(school.addressable_type).to eq('School')

    end

    it "should get addressable_type program " do
      program=Program.create(@program).build_address(@address)

      expect(program.addressable_type).to eq('Program')

    end
  end

  context "when Address be validates error" do
    it "should validates address1 can't be blank " do
      address = Address.new(address1: nil)
      address.valid?
      expect(address.errors[:address1]).to include("can't be blank")
      expect(address.errors[:addressable_type]).to include("can't be blank")
    end
  end

  context "When address can get state" do
    it "should get San-Jose" do
      address = Address.new(@address)
      puts "state: #{address.state}"
      puts "address: #{address.inspect}"
      expect(address.state.name).to eq("San-Jose")
    end
  end

  context "When address can get city" do
    it "should get San-Jose" do
      address = Address.new(@address)
      expect(address.city.name).to eq("Palo-Alto")
    end
  end

end
