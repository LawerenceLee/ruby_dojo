require 'rails_helper'

RSpec.describe Message, type: :model do
  context "with valid attributes" do
    it "should save" do
      expect(build(:message)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if content field is blank" do
      expect(build(:message, content: "")).to be_invalid
    end
    it "should not save if user field is blank" do
      expect(build(:message, user_id: "")).to be_invalid
    end
  end
end
