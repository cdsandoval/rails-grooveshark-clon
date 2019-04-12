require 'rails_helper'

RSpec.describe Api::SongsController, type: :controller do

  before do
    Song.delete_all
    @song1 = Song.create( title: "How long",
                          duration: 214,
                          rating: 0,
                          progress: 0)
  end

  describe "GET #new" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'render json with all users' do
      get :index
      songs = JSON.parse(response.body)
      expect(songs.size).to eq 1
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @song1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct song' do
      get :show, params: { id: @song1.id }
      expected_song = JSON.parse(response.body)
      expect(expected_song["id"]).to eq(@song1.id)
    end

    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PUT progress' do
    it 'returns http status ok' do
      get :song_progress, params: { id: @song1.id, progress: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'returns http status bad request' do
      get :song_progress, params: { id: @song1.id, progress: 10000 }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns a message from updated user' do
      get :song_progress, params: { id: @song1.id, progress: 20 }
      expected_movie = JSON.parse(response.body)
      expect(expected_movie["message"]).to eq("Update successfull playback movie")
    end
  end

  describe 'PUT rating' do
    it 'returns http status ok' do
      get :song_rating, params: { id: @song1.id, rating: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'returns http status bad request' do
      get :song_rating, params: { id: @song1.id, rating: 20 }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns a message from updated user' do
      get :song_rating, params: { id: @song1.id, rating: -1 }
      expected_movie = JSON.parse(response.body)
      expect(expected_movie["message"]).to eq("Update successfull rating movie")
    end
  end

end
