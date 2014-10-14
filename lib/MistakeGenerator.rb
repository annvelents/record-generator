Dir[File.expand_path('../Person.rb', __FILE__)].each {|f| require f}

class MistakeGenerator
	def initialise
	end
	def mistakes(p, persons)
		persons.map!{|e| e.to_a}
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
			index_of_field = rand(3)
			index_of_letter = rand(persons_with_mistakes[index_of_person][index_of_field].length)
			index_of_letter += 1 if (persons_with_mistakes[index_of_person][index_of_field][index_of_letter] == ' ') || (persons_with_mistakes[index_of_person][index_of_field][index_of_letter] == ',') 
			persons_with_mistakes[index_of_person][index_of_field][index_of_letter] = (33 + rand(89)).chr
			persons_with_mistakes[index_of_person][index_of_field][index_of_letter] = persons_with_mistakes[index_of_person][index_of_field][index_of_letter-1] if persons_with_mistakes[index_of_person][index_of_field][index_of_letter] == persons[index_of_person][index_of_field][index_of_letter]
		end
		result = Array.new(persons_with_mistakes.count){Person.new()}
		persons_with_mistakes.each_with_index do|array, index| 
			result[index].to_pers array
		end
		result
	end
end