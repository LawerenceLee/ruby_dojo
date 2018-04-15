require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "With valid attributes" do 
      it "should save" do 
        expect(build(:comment, user: build(:user))).to be_valid
      end
    end
    context "With invalid attributes" do 
      it "should not save if content field is blank" do
        expect(build(:comment, user: build(:user), content: "")).to be_invalid
      end
      it "should not save if content field is blank" do
        expect(build(:comment, user_id: "")).to be_invalid
      end
    end
end
