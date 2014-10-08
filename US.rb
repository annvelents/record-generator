require 'rubygems'
require 'faker'

full_states =  {'AL' =>'Alabama', 'AK' => 'Alaska', 'AZ' => 'Arizona', 'AR' => 'Arkansas', 'CA' => 'California', 'CO' => 'Colorado', 
					'CT' => 'Connecticut', 'DE' => 'Delaware', 'FL' => 'Florida', 'GA' => 'Georgia', 'HI' => 'Hawaii', 'ID' => 'Idaho', 
					'IL' => 'Illinois', 'IN' => 'Indiana', 'IA' => 'Iowa', 'KS' => 'Kansas', 'KY' => 'Kentucky', 'LA' => 'Louisiana', 
					'ME' => 'Maine', 'MD' => 'Maryland', 'MA' => 'Massachusetts', 'MI' => 'Michigan', 'MN' => 'Minnesota', 'MS' => 'Mississippi', 
					'MO' => 'Missouri', 'MT' => 'Montana', 'NE' => 'Nebraska', 'NV' => 'Nevada', 'NH' => 'New Hampshire', 'NJ' => 'New Jersey', 
					'NM' => 'New Mexico', 'NY' => 'New York', 'NC' => 'North Carolina', 'ND' => 'North Dakota', 'OH' => 'Ohio', 'OK' => 'Oklahoma', 
					'OR' => 'Oregon', 'PA' => 'Pennsylvania', 'RI' => 'Rhode Island', 'SC' => 'South Carolina', 'SD' => 'South Dakota', 'TN' => 'Tennessee', 
					'TX' => 'Texas', 'UT' => 'Utah', 'VT' => 'Vermont', 'VA' => 'Virginia', 'WA' => 'Washington', 'WV' => 'West Virginia', 'WI' => 'Wisconsin', 'WY' => 'Wyoming'}

count = ARGV[1].to_i
propability = ARGV[2].to_f

def create_persons(count, full_states)
	counter = Array.new(count)

	count.times do |i|
		Faker::Config.locale = 'en-US'
		state_abbr = Faker::Address.state_abbr
		counter[i] = [Faker::Name.name, Faker::Address.street_address(true), Faker::Address.city, full_states[state_abbr], Faker::Address.zip_code(state_abbr), Faker::PhoneNumber.cell_phone]
	end
	counter
end

def mistakes(p, persons)
	persons_with_mistakes = Array.new(persons.count) {|e| e = []}
	persons.each_with_index do |person, ind|
		person.each_with_index do |field, ind_field|
			persons_with_mistakes[ind][ind_field] = String.new(field)
		end
	end
	number_of_mistakes = (p * persons.count).to_i
	number_of_mistakes.times do |mistake|
		index_of_person = rand(persons.count)
		loop do
			break if persons[index_of_person] == persons_with_mistakes[index_of_person]
			index_of_person = rand(persons.count)
		end
		index_of_field = rand(6)
		index_of_letter = rand(persons_with_mistakes[index_of_person][index_of_field].length)
		index_of_letter += 1 if persons_with_mistakes[index_of_person][index_of_field][index_of_letter] == ' ' 
		persons_with_mistakes[index_of_person][index_of_field][index_of_letter] = (33 + rand(89)).chr
		persons_with_mistakes[index_of_person][index_of_field][index_of_letter] = persons_with_mistakes[index_of_person][index_of_field][index_of_letter-1] if persons_with_mistakes[index_of_person][index_of_field][index_of_letter] == persons[index_of_person][index_of_field][index_of_letter]
	end
	result = []
	persons_with_mistakes.each_with_index do |person, index|
		result[index]  = "#{person[0]}; #{person[1]}, #{person[2]}, #{person[3]}, #{person[4]}; #{person[5]} "
	end
	result
end

persons = create_persons count, full_states
# persons.each { |e| p e }
# puts "------------------------------------------------------------------------------"
result = mistakes(propability, persons)
result.each { |e| p e}




# 		counter[i] = "#{Faker::Name.name};"

# counter[i] << " #{Faker::Address.street_address(true)}, #{Faker::Address.city}, #{full_states[state_abbr]}, #{Faker::Address.zip_code(state_abbr)}; #{Faker::PhoneNumber.cell_phone}"