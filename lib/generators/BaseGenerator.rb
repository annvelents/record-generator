Dir[File.expand_path('../Person.rb', __FILE__)].each {|f| require f}

class BaseGenerator
    #FIELDS =  %i(name address phone)
	def self.generate_data_for(person)
    #FIELDS.each { |field| person.send("#{field}=", self.send(field))}
    person.name = create_name
    person.address = create_address
    person.telephone = create_telephone
	end

	def self.create_name
		raise NotImplementedError
  end
  def self.create_address
    raise NotImplementedError
  end
  def self.create_telephone
    raise NotImplementedError
  end
end