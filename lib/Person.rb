class Person
  attr_accessor :name, :address, :telephone
  def initialize
    @name = ''
    @address = ''
    @telephone = ''
  end

  
  def to_s
     "#{@name}; #{@address}; #{@telephone}"
  end
  def to_a
     [@name, @address, @telephone]
  end
  def to_pers array
    @name = array[0]
    @address = array[1]
    @telephone = array[2]
  end
end
