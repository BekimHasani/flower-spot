require 'rails_helper'

RSpec.describe SightingsController, type: :controller do
  describe 'Post /sightings' do
    it 'sighting create successfully' do
      user = create :user
      flower = create :flower

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {
        longitude: '3241,23',
        latitude: '2342.32',
        user_id: user.id,
        flower_id: flower.id }

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(body['user_id']).to eq(user.id)
      expect(body['flower_id']).to eq(flower.id)
    end

    it 'sighting create without user_id' do
      user = create :user
      flower = create :flower

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {
        longitude: '3241,23',
        latitude: '2342.32',
        flower_id: flower.id }

      puts response.status
      body = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(body['errors'][0]).to eq("User must exist")
    end

    it 'sighting create without flower_id' do
      user = create :user

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {
        longitude: '3241,23',
        latitude: '2342.32',
        user_id: user.id }

      body = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(body['errors'][0]).to eq("Flower must exist")
    end

    it 'sighting create without longitude' do
      user = create :user
      flower = create :flower

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {
        latitude: '2342.32',
        user_id: user.id,
        flower_id: flower.id }

      body = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(body['errors'][0]).to eq("Longitude can't be blank")
    end

    it 'sighting create without latitude' do
      user = create :user
      flower = create :flower

      request.headers["Authorization"] = user_login(user_id: user.id)
      post :create, params: {
        longitude: '3241,23',
        user_id: user.id,
        flower_id: flower.id }

      body = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(body['errors'][0]).to eq("Latitude can't be blank")
    end
  end

  describe "Get /sightings" do
    it "by flower id" do
      user = create :user
      flower = create :flower
      create(:sighting, user_id: user.id, flower_id: flower.id)
      create(:sighting, user_id: user.id, flower_id: flower.id)
      create(:sighting, user_id: user.id, flower_id: flower.id)

      get :get_by_flower , params: {flower_id: flower.id}

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(body.size).to eq(3)
    end
  end

  describe "Delete /sightings" do

    it "by owner" do
      user = create :user
      flower = create :flower
      sighting = create(:sighting, user_id: user.id, flower_id: flower.id)

      request.headers["Authorization"] = user_login(user_id: user.id)
      delete :destroy, params: {id: sighting.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['id']).to eq(sighting.id)
    end

    it "by unknown" do
      user = create :user
      otherUser = create(:user, username: "fisteku")
      flower = create :flower
      sighting = create(:sighting, user_id: user.id, flower_id: flower.id)

      request.headers["Authorization"] = user_login(user_id: otherUser.id)
      delete :destroy, params: {id: sighting.id}

      body = JSON.parse(response.body)
      expect(response).to have_http_status(412)
      expect(body['errors'][0]).to eq("A sight can be destroyed only by the owner!")
    end
  end
end