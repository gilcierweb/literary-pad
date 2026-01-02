require 'rails_helper'

RSpec.describe "Discovers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/discover/index"
      expect(response).to have_http_status(:success)
    end
  end

end
