require 'rails_helper'

RSpec.describe FlowersController, type: :controller do
  describe "Get /flowers" do
    it "fetch all" do

      create(:flower, name: "redRose", description: "red flower")
      create(:flower, name: "lotus", description: "white flower")
      create(:flower, name: "jasmine", description: "purple flower")

      get :index

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(body.size).to eq(3)
    end
  end

end
