require 'rubygems'
require 'faker'
require 'carmen'

class US
	def self.create_person
		Faker::Config.locale = 'en-US'
		state_abbr = Faker::Address.state_abbr
		counter = [Faker::Name.name, Faker::Address.street_address(true), Faker::Address.city, 
									Carmen::Country.named('United States').subregions.coded(state_abbr).name, 
									Faker::Address.zip_code(state_abbr), Faker::PhoneNumber.cell_phone]
	end
end
