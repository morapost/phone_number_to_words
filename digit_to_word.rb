require 'pry'
DigitToWord = Struct.new(:phone_number) do
	POSSIBLE_COMBINATION_LENGTH = [3,4,5,6,7,10]
	WORD_NUM_HASH = { "A" => "2", "B" => "2", "C" => "2", "D" => "3", "E" => "3", "F" => "3", "G" => "4", "H" => "4", "I" => "4", "J" => "5",
                  "K" => "5", "L" => "5", "M" => "6", "N" => "6", "O" => "6", "P" => "7", "Q" => "7", "R" => "7", "S" => "7", "T" => "8",
                  "U" => "8", "V" => "8", "W" => "9", "X" => "9", "Y" => "9", "Z" => "9" }
    # Split input into chunks of chars [[10], [7, 3], [6, 4], [5, 5], [4, 6], [4, 3, 3], [3, 7], [3, 4, 3], [3, 3, 4]]
	
	CHUNK_PATTERNS = [[0..9], [0..6, 7..9], [0..5, 6..9], [0..4, 5..9], [0..3, 4..9],[0..2, 3..9]]

	def perform
		read_dictionary
		split_number_into_chunks
		print_output
	end

	def read_dictionary
		@dict = {}
		File.readlines('dictionary.txt').each do |word|
			word.strip!
			number = word_to_number(word)
			next if number.nil?
			@dict[number] ||= []
			@dict[number] << word
			
		end
	end

	def word_to_number(word)
		return unless POSSIBLE_COMBINATION_LENGTH.include? word.length
		numbers = ''
		word.split('').map {|char| numbers << WORD_NUM_HASH[char]}
		#binding.pry
		numbers
	end

	def split_number_into_chunks
		@chunks_dict = {}
		@chunks = []
		CHUNK_PATTERNS.each do |chunks|
			new_chunk = []
			chunks.each do |chunk|
				phone_number_chunk = phone_number[chunk]
				found_words_from_dict = @dict[phone_number_chunk] 
				@chunks_dict[phone_number_chunk] = found_words_from_dict if found_words_from_dict
				new_chunk << phone_number_chunk
			end
			@chunks << new_chunk

		end
	end

	def print_output
		@chunks.each do |chunk|
			binding.pry
		end
	end
end

test = DigitToWord.new("2282668687").perform

