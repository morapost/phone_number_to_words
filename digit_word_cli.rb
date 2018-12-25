require './digit_to_word.rb'
cont ='y'
while(cont == 'y')
	
	puts "Enter ten digit phone number"
	input_number = gets.chomp
	if input_number.length < 10
		puts "Enter a 10 digit number"
		return
		elsif (!!(input_number =~ /0|1/))
			puts "Enter digits without 1 or 0"
			return
		else
			test_case = DigitToWord.new(input_number).perform
			p test_case
			puts "Sorry no matching words in dictionary" if test_case.empty?
	end

	puts "Do you want to continue(y/n)"

	cont = gets.chomp.downcase
	 if cont != 'y' 
	 	puts "Thank you..."
	 end
end