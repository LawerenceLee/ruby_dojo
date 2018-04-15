require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #process_message" do
    it "returns http success" do
      get :process_message
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #process_comment" do
    it "returns http success" do
      get :process_comment
      expect(response).to have_http_status(:success)
    end
  end

end
