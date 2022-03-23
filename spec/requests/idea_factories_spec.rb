require 'rails_helper'

RSpec.describe "IdeaFactories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/idea_factories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/idea_factories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/idea_factories/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/idea_factories/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
