require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe "Post /likes" do
    it "like create successfully" do
      user = create :user
      flower = create :flower
      sighting = create(:sighting, user_id: user.id, flower_id: flower.id)

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {user_id: user.id, sighting_id: sighting.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(body["user_id"]).to eq(user.id)
      expect(body["sighting_id"]).to eq(sighting.id)
    end

    it "like create without user_id" do
      user = create :user
      flower = create :flower
      sighting = create(:sighting, user_id: user.id, flower_id: flower.id)

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {sighting_id: sighting.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(body["errors"][0]).to eq("User must exist")
    end

    it "like create without user_id" do
      user = create :user

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {user_id: user.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(body["errors"][0]).to eq("Sighting must exist")
    end
  end

  describe "Delete /likes" do

    it "by owner" do
      user = create :user
      flower = create :flower
      sighting = create(:sighting, user_id: user.id, flower_id: flower.id)
      like = create(:like, user_id: user.id, sighting_id: sighting.id)

      request.headers["Authorization"] = user_login(user_id: user.id)
      delete :destroy, params: {id: like.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['id']).to eq(like.id)
    end

    it "by unknown" do
      user = create :user
      otherUser = create(:user, username: "fisteku")
      flower = create :flower
      sighting = create(:sighting, user_id: user.id, flower_id: flower.id)
      like = create(:like, user_id: user.id, sighting_id: sighting.id)

      request.headers["Authorization"] = user_login(user_id: otherUser.id)
      delete :destroy, params: {id: like.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(412)
      expect(body['errors'][0]).to eq("A like can be revert only by the owner!")
    end
  end
end
