require 'optparse'
Dir[File.expand_path('../lib/Person.rb', __FILE__), File.expand_path('../lib/MistakeGenerator.rb', __FILE__)].each {|f| require f}
#require_relative 'lib/Person'

options = {:region => nil, :count => nil, :propability => nil}

parser = OptionParser.new do|opts|
  #opts.banner = "Usage: years.rb [options]"
  opts.on('-r', '--region ', 'Region') do |region|
    options[:region] = region;
  end

  opts.on('-c', '--count ', 'Count') do |count|
    options[:count] = count;
  end

  opts.on('-p', '--propability ', 'Propability') do |propability|
    options[:propability] = propability
  end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end
end

parser.parse!
loop do
  if options[:region] == nil
    p 'Enter Region: '
    options[:region] = gets.chomp
  end
  unless options[:region] == 'US' || options[:region] == 'RU' || options[:region] == 'BY'
    p 'Enter correct Region (US, RU, BY)'
    options[:region] = gets.chomp
  end

  if options[:count] == nil
    p 'Enter Count: '
     options[:count] = gets.chomp.to_i
   else
    options[:count] = options[:count].to_i
  end
  unless options[:count] > 0 && options[:count] < 100000
    p 'Enter corrct Count (must be more than 0 and less than 100 000): '
    options[:count] = gets.chomp.to_i
  end

  if options[:propability] == nil
    p 'Enter Propability: '
    options[:propability] = gets.chomp.to_f
  else
    options[:propability] = options[:propability].to_i
  end
  unless options[:propability] >= 0 && options[:propability] <= 1
    p 'Enter correct Propability (must be not less than 0 and not more than 1): '
    options[:propability] = gets.chomp.to_f
  end
  break if (options[:region] == 'US' || options[:region] == 'RU' || options[:region] == 'BY') && (options[:count] > 0 && options[:count] < 100000) && (options[:propability] >= 0 && options[:propability] <= 1)
end

result = Array.new(options[:count]) { Person.new(options[:region]) }
result.each do |pers|
  pers.generate
end
result.each {|e| puts e.to_s}
puts "=" * 80
result = MistakeGenerator.mistakes(1, result)
result.each {|e| puts e.to_s}
