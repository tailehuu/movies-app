require 'rails_helper'

RSpec.describe MoviesController do
  describe 'GET #index' do
    context 'Signed in' do
      it 'returns shared movies by the user' do
        expect(true).to eq false
      end
    end

    context 'Not sign in' do
      it 'returns all movies' do
        expect(true).to eq false
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
