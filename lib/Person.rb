Dir[File.expand_path('../PersonGenerator.rb', __FILE__)].each {|f| require f}


class Person
  def initialize(reg)
    @region = reg
  end

  def generate 
    generated_array = PersonGenerator.generate(@region)
    @name = generated_array[0]
    @address = generated_array[1]
    @city = generated_array[2]
    @state = generated_array[3]
    @zip_code = generated_array[4]
    @telephone = generated_array[5]
  end

  def to_s
    return "#{@name}; #{@address}, #{@city}, #{@state}, #{@zip_code}; #{@telephone}"
  end
  def to_a
    return [@name, @address, @city, @state, @zip_code, @telephone]
  end
  def to_pers array
    @name = array[0]
    @address = array[1]
    @city = array[2]
    @state = array[3]
    @zip_code = array[4]
    @telephone = array[5]
  end
end
