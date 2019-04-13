require 'rails_helper'

RSpec.describe Api::SongsController, type: :controller do

  before do
    Song.delete_all
    @song1 = Song.create( title: "How long",
                          duration: 214,
                          rating: 0,
                          progress: 0)
    @song2 = Song.create( title: "You have done for me",
                          duration: 267,
                          rating: 0,
                          progress: 0)
    @song3 = Song.create( title: "The long son",
                          duration: 273,
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
      expect(songs.size).to eq 3
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

  describe 'GET search' do
    it 'returns http status ok' do
      get :search, params: { title: "long" }
      expect(response).to have_http_status(:ok)
    end

    it 'render the founded songs' do
      get :search, params: { title: "long" }
      expected_song = JSON.parse(response.body)
      expect(expected_song.size).to eq(2)
    end

    it 'returns http status ok when there no founded songs' do
      get :search, params: { title: "first" }
      expected_song = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(expected_song.size).to eq(0)
    end

    it 'returns all songs when the name of parameter is not title' do
      get :search, params: { tittle: "first" }
      expected_song = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(expected_song.size).to eq(3)
    end
  end

  describe 'PUT progress' do
    it 'returns http status ok' do
      get :song_progress, params: { id: @song1.id, progress: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'returns http status bad request' do
      get :song_progress, params: { id: @song1.id, progress: 10000 }
      expected_song = JSON.parse(response.body)
      expect(response).to have_http_status(:bad_request)
      expect(expected_song["message"]).to eq("Progress has to be lower or equal than #{@song1.duration}")
    end

    it 'returns http status bad request when the name of parameter is not progress' do
      get :song_progress, params: { id: @song1.id, progres: 10000 }
      expected_song = JSON.parse(response.body)
      expect(response).to have_http_status(:bad_request)
      expect(expected_song["message"]).to eq("This request has to have the parameters id and progress")
    end

    it 'returns a message from updated user' do
      get :song_progress, params: { id: @song1.id, progress: 20 }
      expected_song = JSON.parse(response.body)
      expect(expected_song["message"]).to eq("Update succesful, the song has 20 seconds in progress")
    end
  end

  describe 'PUT rating' do
    it 'returns http status ok' do
      get :song_rating, params: { id: @song1.id, rating: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'returns http status bad request' do
      get :song_rating, params: { id: @song1.id, rating: 20 }
      expected_song = JSON.parse(response.body)
      expect(response).to have_http_status(:bad_request)
      expect(expected_song["message"]).to eq("The value of rating has to be -1, 0 or 1")
    end

    it 'returns http status bad request when the name of parameter is not rating' do
      get :song_rating, params: { id: @song1.id, ratin: 100 }
      expected_song = JSON.parse(response.body)
      expect(response).to have_http_status(:bad_request)
      expect(expected_song["message"]).to eq("This request has to have the parameters id and rating")
    end

    it 'returns a message from updated user' do
      get :song_rating, params: { id: @song1.id, rating: -1 }
      expected_song = JSON.parse(response.body)
      expect(expected_song["message"]).to eq("Update successfully rating song")
    end
  end

end
