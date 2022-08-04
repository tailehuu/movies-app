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
    it 'creates movie successfully' do
      expect(true).to eq false
    end

    context 'Not sign in' do
      it 'returns error' do
        expect(true).to eq false
      end
    end

    context 'title is empty' do
      it 'returns error' do
        expect(true).to eq false
      end
    end

    context 'description is empty' do
      it 'returns error' do
        expect(true).to eq false
      end
    end

    context 'link is empty' do
      it 'returns error' do
        expect(true).to eq false
      end
    end
  end
end
