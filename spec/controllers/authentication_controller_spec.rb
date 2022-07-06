require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe "Authentication / login " do
    it "with valid credentials" do
      user = create :user

      post :login, params: {
        email: user.email,
        password: user.password,
      }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end

    it "with wrong password" do
      user = create :user

      post :login, params: {
        email: user.email,
        password: "test",
      }

      expect(response).to have_http_status(401)
      expect(JSON.parse(response.body)['error']).to eq("unauthorized")
    end

    it "with wrong email" do
      user = create :user

      post :login, params: {
        email: "test",
        password: user.password,
      }

      expect(response).to have_http_status(401)
      expect(JSON.parse(response.body)['error']).to eq("unauthorized")
    end

  end
end
