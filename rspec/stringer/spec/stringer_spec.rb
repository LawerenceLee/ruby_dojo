RSpec.describe Stringer do
  # it "has a version number" do
  #   expect(Stringer::VERSION).not_to be nil
  # end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

    it "concatenates undefined number of strings with a space" do 
        expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
    end

    context "shorterns a str to a specified length" do
        it 'if str too long, shorten and add "..."' do
            expect(Stringer.minify "Hello, it's me", 5).to eq("Hello...")
        end
        it 'if str is not too long, simply return it' do
            expect(Stringer.minify "Hi", 5).to eq("Hi")
        end
    end

    it 'replaces occurences of a word in a str with a replacement' do
        expect(Stringer.replacify("I can't do this", "can't", "can")).to eq("I can do this")
    end

    it 'iterates over a string and adds each word into an array' do
        expect(Stringer.tokenize("I love to code")).to eq(["I", "love", "to", "code"])
    end

    it 'removes each instance of the second parameter within the original string' do
        expect(Stringer.removify("I'm not a developer", "not")).to eq("I'm a developer")
    end
end
