require "rspec/autorun"


class Calculator 
	def add(a, b)
		a + b
	end

	def factorial(n)
		if n ==0 
			1
		else
			(1..n).reduce(:*)
		end
	end

	def multiplication(a, b)
		a * b
	end

	def subtraction(a, b)
		a - b
	end
end

describe Calculator do
	describe "#add" do

		it "returns the sum of its two arguments" do

			calc = Calculator.new
			expect(calc.add(5, 10)). to eq(15)
		end

		it "retuns the sum of two diferent arguments" do

			calc = Calculator.new
			expect(calc.add(1, 5)). to eq(6)
		end 


		it "retuns the sum of two diferent arguments" do

			calc = Calculator.new
			expect(calc.add(1000, 100)). to eq(1100)
		end 
	end

	describe "#factorial" do
		it "retrns 1 when given 0" do

			calc = Calculator.new
			expect(calc.factorial(0)). to eq(1)
		end

		it "returns 120 when given 5" do 

			calc = Calculator.new
			expect(calc.factorial(5)). to eq(120)
		end
	end

	describe "#multiplication" do
		it "returns the result of two arguments" do

			calc = Calculator.new
			expect(calc.multiplication(5, 10)). to eq(50)
		end

		it "returns the result of another two arguments" do

			calc = Calculator.new
			expect(calc.multiplication(3, 3)). to eq(9)
		end
	end

	describe "#subtraction" do
		it "returns the result of two arguments" do

			calc = Calculator.new
			expect(calc.subtraction(5, 1)). to eq(4)
		end

		it "returns the result of another two arguments" do

			calc = Calculator.new
			expect(calc.subtraction(3, 3)). to eq(0)
		end

		it "Tests for negative answers" do

			calc = Calculator.new
			expect(calc.subtraction(3, 5)). to eq(-2)
		end
	end
end 