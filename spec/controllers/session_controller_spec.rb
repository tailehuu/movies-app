require 'rails_helper'

RSpec.describe SessionController do
  describe 'POST #sign_in' do
    let(:email) { 'tai.le@local.com' }
    let(:password) { '123456' }
    let!(:user) { FactoryGirl.create(:user, email: email, password: password) }
    let(:params) do
      {
        user: {
          email: email,
          password: password
        }
      }
    end

    it 'returns user information successfully' do
      post :sign_in, params

      expect(response).to have_http_status :ok
      body = JSON.parse response.body
      expect(body['id']).to be_present
      expect(body['email']).to eq email
      expect(body['jwt_token']).to be_present
      expect(body['created_at']).to be_present
    end

    context 'User not found' do
      let(:params) do
        {
          user: {
            email: 'unknow@local.com',
            password: password
          }
        }
      end
      let(:message) { 'user_not_found' }

      it 'returns error' do
        post :sign_in, params

        expect(response).to have_http_status :not_found
        expect(JSON.parse(response.body)['message']).to eq message
      end
    end

    context 'Invalid email or password' do
      let(:params) do
        {
          user: {
            email: email,
            password: 'wrong-password'
          }
        }
      end
      let(:message) { 'invalid_email_or_password' }

      it 'returns error' do
        post :sign_in, params

        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['message']).to eq message
      end
    end
  end

  describe 'POST #sign_out' do
    let(:message) { 'success' }

    it 'returns success message' do
      post :sign_out

      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body)['message']).to eq message
    end
  end
end
