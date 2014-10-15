require 'rubygems'
require 'faker'
require 'carmen'
Dir[File.expand_path('./BaseGenerator.rb', __FILE__)].each {|f| require f}

class UsGenerator < BaseGenerator
	def self.create_name
		Faker::Name.name
	end
	def self.create_address
		Faker::Config.locale = 'en-US'
		state_abbr = Faker::Address.state_abbr
		counter = "#{Faker::Address.street_address(true)}, #{Faker::Address.city}, #{Carmen::Country.named('United States').subregions.coded(state_abbr).name}, #{Faker::Address.zip_code(state_abbr)}, USA"
	end
	def self.create_telephone
		Faker::PhoneNumber.cell_phone
	end
end
