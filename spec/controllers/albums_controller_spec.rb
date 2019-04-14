require 'rails_helper'

RSpec.describe Api::AlbumsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'render json with all users' do
      get :index
      albumss = JSON.parse(response.body)
      expect(albums.size).to eq 1
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @album1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the right album' do
      get :show, params: { id: @album1.id }
      expected_album = JSON.parse(response.body)
      expect(expected_album["id"]).to eq(@album1.id)
    end

    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PUT rating' do
    it 'returns http status ok' do
      get :album_rating, params: { id: @album1.id, rating: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'returns http status bad request' do
      get :album_rating, params: { id: @album1.id, rating: 20 }
      expected_album = JSON.parse(response.body)
      expect(response).to have_http_status(:bad_request)
      expect(expected_album["message"]).to eq("The value of rating has to be -1, 0 or 1")
    end
  end

end
