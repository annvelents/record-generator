require 'optparse'
Dir[File.expand_path('../lib/Person.rb', __FILE__), File.expand_path('../lib/MistakeGenerator.rb', __FILE__), File.expand_path('../lib/GeneratorFactory.rb', __FILE__)].each {|f| require f}

options = {:region => nil, :count => nil, :propability => nil}

parser = OptionParser.new do|opts|
  opts.on('-r', '--region ', 'Region') do |region|
    if ['US', 'RU', 'BY'].include?(region)
      options[:region] = region
    else 
      raise ArgumentError, 'Wrong Region'
    end
  end

  opts.on('-c', '--count ', 'Count') do |count|
    if [*(0..100000)].include?(count.to_i)
      options[:count] = count.to_i
    else 
      raise ArgumentError, 'Wrong Count'
    end
  end

  opts.on('-p', '--propability ', 'Propability') do |propability|
    propability = propability.to_f
    if propability >= 0 && propability <= 1
      options[:propability] = propability
    else
      raise ArgumentError, 'Wrong Propability'
    end
  end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end
end
parser.parse!


result = Array.new(options[:count]) { Person.new() }
GeneratorPersons = GeneratorFactory.new()
result.each do |pers|
  GeneratorPersons.factory(pers, options[:region])
end
MakeMistake = MistakeGenerator.new()
result = MakeMistake.mistakes(1, result)

result.each {|e| puts e}