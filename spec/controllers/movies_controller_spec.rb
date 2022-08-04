require 'rails_helper'

RSpec.describe MoviesController do
  describe 'GET #index' do
    let(:user_a) { FactoryGirl.create(:user) }
    let(:user_b) { FactoryGirl.create(:user) }

    before do
      (1..3).each do |n|
        FactoryGirl.create(:movie, user: user_a)
        FactoryGirl.create(:movie, user: user_b)
      end
    end

    context 'Signed in' do
      before do
        allow_any_instance_of(MoviesController).to receive(:current_user).and_return(user_a)
      end

      it 'returns shared movies by the user' do
        get :index

        expect(response).to have_http_status :ok
        body = JSON.parse response.body
        expect(body['data'].size).to      eq 3
        expect(body['current_page']).to   eq 1
        expect(body['total_pages']).to    eq 1
      end
    end

    context 'Not sign in' do
      it 'returns all movies' do
        get :index

        expect(response).to have_http_status :ok
        body = JSON.parse response.body
        expect(body['data'].size).to    eq 6
        expect(body['current_page']).to eq 1
        expect(body['total_pages']).to  eq 1
      end
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryGirl.create(:user) }
    let(:title) { 'title' }
    let(:description) { 'description' }
    let(:link) { 'link' }
    let(:params) do
      {
        movie: {
          title: title,
          description: description,
          link: link
        }
      }
    end

    before do
      allow_any_instance_of(MoviesController).to receive(:current_user).and_return(user)
    end

    it 'creates movie successfully' do
      post :create, params

      expect(response).to have_http_status :ok
      body = JSON.parse response.body
      expect(body['title']).to        eq title
      expect(body['description']).to  eq description
      expect(body['link']).to         eq link
      expect(body['shared_by']).to    eq user.email
    end

    context 'Not sign in' do
      let(:message) { 'not_authorized' }

      before do
        allow_any_instance_of(MoviesController).to receive(:current_user).and_return(nil)
      end

      it 'returns error' do
        post :create, params

        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['message']).to eq message
      end
    end

    context 'title is empty' do
      let(:title) { nil }
      let(:errors) do
        {
          'title' => ['must present']
        }
      end

      it 'returns error' do
        post :create, params

        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['errors']).to include(errors)
      end
    end

    context 'description is empty' do
      let(:description) { nil }
      let(:errors) do
        {
          'description' => ['must present']
        }
      end

      it 'returns error' do
        post :create, params

        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['errors']).to include(errors)
      end
    end

    context 'link is empty' do
      let(:link) { nil }
      let(:errors) do
        {
          'link' => ['must present']
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
