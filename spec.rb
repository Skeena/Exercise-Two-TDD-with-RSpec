# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # Found this cool Ruby function which returns the string, first removing all whitespace on both 
  # ends of the string, and then changing remaining consecutive whitespace groups into one space each.
  def squish(s)
    s.strip.gsub(/\s+/, " ")
  end

  def full_name
    squish("#{@first_name} #{@middle_name} #{@last_name}")
  end

  def full_name_with_middle_initial 
    squish("#{@first_name} #{@middle_name[0] if @middle_name} #{@last_name}")
  end

  def initials
    squish("#{@first_name[0]} #{@middle_name[0] if @middle_name} #{@last_name[0]}")
  end
end

RSpec.describe Person do
  let(:person_with_middle_name){ Person.new(first_name: "George", middle_name: "Michael", last_name: "Schena") }
  let(:person_without_middle_name) { Person.new(first_name: "George", last_name: "Schena") }
  let(:person_with_no_name) { Person.new(first_name: "", middle_name: "", last_name: "") } # Tested an obscure case for practice

  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do 
      expect(person_with_middle_name.full_name).to eq("George Michael Schena")
    end 

     it "does not add extra spaces if middle name is missing" do
      expect(person_without_middle_name.full_name).to eq("George Schena")
    end

     it "should return an empty string if no names are entered" do
      expect(person_with_no_name.full_name).to eq("")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle name initial, and last name with spaces" do
      expect(person_with_middle_name.full_name_with_middle_initial).to eq("George M Schena")
    end

    it "does not add extra spaces if middle name is missing" do
      expect(person_without_middle_name.full_name_with_middle_initial). to eq("George Schena")
    end
  end

  describe "#initials" do 
     it "concatenates first name initial, middle name initial, and last name initial with spaces" do
      expect(person_with_middle_name.initials).to eq("G M S")
     end

     it "does not add extra spaces if middle name is missing" do 
      expect(person_without_middle_name.initials).to eq("G S")
     end
  end
end