Dir[File.expand_path('../*.rb', __FILE__)].each {|f| require f}

class PersonGenerator
  def self.ShowPath
    puts "#{File.expand_path('../*.rb', __FILE__)}"
  end
  def self.generate (regione)
    person = send ("#{regione}_generate")#US.create_person  #
  end
  def self.US_generate
    US.create_person
  end
  def self.RU_generate
    RU.create_person
  end
  def self.BY_generate
    BY.create_person
  end
end