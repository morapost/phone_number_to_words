require './digit_to_word'
require 'rspec-benchmark'
RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
end

describe DigitToWord do
	test_case1_result = ["MOTORTRUCK", [["MOTOR", "TRUCK"], ["MOTOR", "USUAL"], ["NOUNS", "TRUCK"], ["NOUNS", "USUAL"]], [["NOUN", "STRUCK"], ["ONTO", "STRUCK"]]]
	test_case2_result = ["CATAMOUNTS", [["ACTA", "MOUNTS"]], [["ACT", "AMOUNTS"], ["ACT", "CONTOUR"], ["BAT", "AMOUNTS"], ["BAT", "CONTOUR"], ["CAT", "AMOUNTS"], ["CAT", "CONTOUR"]]]
	context "Expected Output" do
		it "displays possible words for given number - 6686787825" do
			test_case1 = DigitToWord.new("6686787825").perform
			expect(test_case1).to match_array(test_case1_result)
			puts "#{test_case1}"
		end	

		it "displays possible words for given number - 2282668687" do
			test_case2 = DigitToWord.new("2282668687").perform
			expect(test_case2).to match_array(test_case2_result)
			puts "#{test_case2}"
		end
	end

	context "Performance Testing" do
		it "should run in less than a second" do
			test_case1 = DigitToWord.new("6686787825").perform
			expect{test_case1}.to perform_under(1000).ms.sample(3).times
		end
	end
end
