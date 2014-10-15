require 'rubygems'
require 'ryba'
require 'yaml'
Dir[File.expand_path('./BaseGenerator.rb', __FILE__)].each {|f| require f}

class ByGenerator < BaseGenerator
  #def generate_for(person)
  @@addr = YAML.load_file("./lib/generators/belarus.yml")
   

  def self.create_name
    Ryba::Name.full_name
  end

  def self.create_address
    addr = @@addr[0]
    random_city = rand(142)
    addres = "Беларусь, #{addr[random_city][2]}, #{addr[random_city][1]}, г. #{addr[random_city][0]}, #{Ryba::Address.address}" 
  end
  def self.create_telephone
    Ryba::PhoneNumber.phone_number
    tel = @@addr[1]
    phone = "#{tel[rand(4)]}#{rand(899) + 100}-#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}"
  end
end
