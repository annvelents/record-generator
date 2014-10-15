Dir[File.expand_path('../generators/*.rb', __FILE__)].each {|f| require f}
require "pry"

class GeneratorFactory

  def self.factory(reg)
    case reg
    when 'US' then UsGenerator
    when 'RU' then RuGenerator
    when 'BY' then ByGenerator
    else raise ArgumentError, 'Wrong Region Name'
    end
  end
end