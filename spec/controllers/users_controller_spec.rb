require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'Post /users' do
    it 'user create successfully' do
      post :create, params: {
        email: 'filanfisteku@gmail.com',
        username: 'filan007',
        password: '1234'}

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(body['email']).to eq('filanfisteku@gmail.com')
      expect(body['username']).to eq('filan007')
    end

    it 'creat with empty email' do
      post :create, params: {
        username: 'filan007',
        password: '1234'}

      body = JSON.parse(response.body)

      expect(response.status).to eq(422)
      expect(body['errors'][0]).to eq("Email can't be blank")
    end

    it 'creat with empty username' do
      post :create, params: {
        email: 'filanfisteku@gmail.com',
        password: '1234'}

      body = JSON.parse(response.body)

      expect(response.status).to eq(422)
      expect(body['errors'][0]).to eq("Username can't be blank")
    end

    it 'creat with empty password' do
      post :create, params: {
        email: 'filanfisteku@gmail.com',
        username: 'filan007'}

      body = JSON.parse(response.body)

      expect(response.status).to eq(422)
      expect(body['errors'][0]).to eq("Password can't be blank")
    end
  end
end
