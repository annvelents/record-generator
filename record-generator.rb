require 'optparse'
Dir[File.expand_path('../lib/Person.rb', __FILE__), File.expand_path('../lib/MistakeGenerator.rb', __FILE__)].each {|f| require f}
#require_relative 'lib/Person'

options = {:region => nil, :count => nil, :propability => nil}

parser = OptionParser.new do|opts|
  opts.on('-r', '--region ', 'Region') do |region|
    options[:region] = region;
  end

  opts.on('-c', '--count ', 'Count') do |count|
    options[:count] = count.to_i;
  end

  opts.on('-p', '--propability ', 'Propability') do |propability|
    options[:propability] = propability.to_f
  end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end
end
parser.parse!

if options[:region] == nil
  puts 'Enter Region (US, RU, BY): '
  options[:region] = gets.chomp
end

if options[:count] == nil
  puts 'Enter Count (0..100 000): '
   options[:count] = gets.chomp.to_i
end

if options[:propability] == nil
  puts 'Enter Propability (0..1): '
  options[:propability] = gets.chomp.to_f
end
p [options[:region], options[:count], options[:propability]]
unless (options[:propability] >= 0 && options[:propability] <= 1) || ['US', 'RU', 'BY'].include?(options[:region]) || [0..100000].include?(options[:count])
  p "p" unless options[:propability] >= 0 && options[:propability] <= 1
  p 'r' unless ['US', 'RU', 'BY'].include?(options[:region])
  p 'c' unless [*(0..100000)].include?(options[:count])
  raise TypeError, 'Some of the entered data were incorrect'
end


result = Array.new(options[:count]) { Person.new(options[:region]) }
result.each do |pers|
  pers.generate
end
result = MistakeGenerator.mistakes(1, result)
result.each {|e| puts e.to_s}