require_relative 'apple_tree'
RSpec.describe AppleTree do
    before(:each) do
       @tree1 = AppleTree.new
    end

    it 'has an age attribute with getter and setter methods.' do
        @tree1.age += 1
        expect(@tree1.age).to eq(1)
    end

    it 'has a height attribute with only a getter method' do
        expect(@tree1.height).to eq(0.1)
        expect{ @tree1.height=2 }.to raise_error(NoMethodError)
    end

    it 'has an apple_count attribute with only a getter method.' do
        expect(@tree1.apple_count).to eq(0)
        expect{ @tree1.apple_count=2 }.to raise_error(NoMethodError)
    end

    it 'has a method called year_gone_by' do
        @tree1.age = 3
        @tree1.year_gone_by
        expect(@tree1.age).to eq(4)
        expect(@tree1.height).to eq(1.1)
        expect(@tree1.apple_count).to eq(2)
    end

    context 'is not less than 4 yrs old' do
        it 'can grow apples' do
            @tree1.age = 3
            @tree1.year_gone_by
            expect(@tree1.apple_count).to eq(2)
        end
    end

    context 'is less than 4 yrs old' do
        it 'cannot grow apples' do
            @tree1.year_gone_by
            expect(@tree1.apple_count).to eq(0)
        end
    end

    context 'is greater than 10 yrs old' do
        it 'cannot grow apples' do
            @tree1.age = 11
            @tree1.year_gone_by
            expect(@tree1.apple_count).to eq(0)
        end
    end

    it 'has a method called pick_apples that sets apple_count to 0' do
        @tree1.pick_apples
        expect(@tree1.apple_count).to eq(0)
    end

end
    
    # • Apple Tree should have a method called pick_apples that takes all of the apples off the tree
    
    # • Apple Tree should not grow apples if it's older than ten.