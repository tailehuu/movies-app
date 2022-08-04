require 'rails_helper'

RSpec.describe RegistrationController do
  describe 'POST #create' do
    let(:email) { 'tai.le@local.com' }
    let(:password) { '123456' }
    let(:params) do
      {
        registration: {
          email: email,
          password: password
        }
      }
    end

    it 'creates user successfully' do
      post :create, params

      expect(response).to have_http_status :ok
      body = JSON.parse response.body
      expect(body['id']).to be_present
      expect(body['email']).to eq email
      expect(body['created_at']).to be_present
    end

    context 'email is empty' do
      let(:email) { nil }
      let(:errors) do
        {
          'email' => ['must present']
        }
      end

      it 'returns error' do
        post :create, params

        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['errors']).to include(errors)
      end
    end

    context 'password is empty' do
      let(:password) { nil }
      let(:errors) do
        {
          'password' => ['must present']
        }
      end

      it 'returns error' do
        post :create, params

        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['errors']).to include(errors)
      end
    end
  end
end
