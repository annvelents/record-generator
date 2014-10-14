Dir[File.expand_path('../UsGenerator.rb', __FILE__), File.expand_path('../RuGenerator.rb', __FILE__)].each {|f| require f}

class GeneratorFactory
  def initialize
  end
  def factory (pers, reg)
    pers.name = factory_name(reg).call
    pers.address = factory_address(reg).call
    pers.telephone = factory_telephone(reg).call
  end
  def factory_name (regione)
    case regione
    when 'US' then return lambda {UsGenerator.create_name}
    when 'RU' then return lambda {RuGenerator.create_name}
    when 'BY' then return lambda {ByGenerator.create_name}
    raise ArgumentError, 'Wrong Region Name'
  end
  end
  def factory_address (regione)
    case regione
    when 'US' then return lambda {UsGenerator.create_address}
    when 'RU' then return lambda {RuGenerator.create_address}
    when 'BY' then return lambda {ByGenerator.create_address}
    raise ArgumentError, 'Wrong Region Name'
  end
  end
  def factory_telephone (regione)
    case regione
    when 'US' then return lambda {UsGenerator.create_telephone}
    when 'RU' then return lambda {RuGenerator.create_telephone}
    when 'BY' then return lambda {ByGenerator.create_telephone}
    raise ArgumentError, 'Wrong Region Name'
  end
  end
end