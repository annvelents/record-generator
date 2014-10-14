require 'rubygems'
require 'ryba'
require 'yaml'

module ByGenerator
  def self.create_name
    Ryba::Name.full_name
  end
  def self.create_address
    addr = YAML.load_file("./lib/belarus.yml")
    addr = addr[0]
    random_city = rand(142)
    addres = "Беларусь, #{addr[random_city][2]}, #{addr[random_city][1]}, г. #{addr[random_city][0]}, #{Ryba::Address.address}" 
  end
  def self.create_telephone
    Ryba::PhoneNumber.phone_number
    tel = YAML.load_file("./lib/belarus.yml")
    tel = tel[1]
    phone = "#{tel[rand(4)]}#{rand(899) + 100}-#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}"
  end
end
