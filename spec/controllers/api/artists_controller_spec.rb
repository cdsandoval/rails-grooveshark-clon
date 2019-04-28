require 'rails_helper'

RSpec.describe Api::ArtistsController, type: :controller do
  before do
    Artist.delete_all
    Song.delete_all
    Album.delete_all
    @song1 = Song.create( title: "How long",
                          duration: 214,
                          
                          progress: 0)
    @album1 = Album.create( title: "Nuevo album"
                            )
    @artist1 = Artist.create(  name: "Juanes",
                              age: "35")
    @artist1.songs << @song1
    @artist1.albums << @album1

    @song2 = Song.create( title: "You have done for me",
                          duration: 267,
                          
                          progress: 0)
    @album2 = Album.create( title: "Nuevo album2"
                            )
    @artist2 = Artist.create(  name: "Juan Gabriel",
                              age: "46")
    @artist2.songs << @song2
    @artist2.albums << @album2

    @song3 = Song.create( title: "The long son",
                          duration: 273,
                          
                          progress: 0)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'render json with all artists' do
      get :index
      artists = JSON.parse(response.body)
      expect(artists.size).to eq 2
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @artist1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct album' do
      get :show, params: { id: @artist1.id }
      expected_artist = JSON.parse(response.body)
      expect(expected_artist["id"]).to eq(@artist1.id)
    end

    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET search' do
    it 'returns http status ok' do
      get :search, params: { name: "Juan" }
      expect(response).to have_http_status(:ok)
    end

    it 'render the founded artists' do
      get :search, params: { name: "Juan" }
      expected_artist = JSON.parse(response.body)
      expect(expected_artist.size).to eq(2)
    end

    it 'returns http status ok when there no founded artists' do
      get :search, params: { name: "first" }
      expected_artist = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(expected_artist.size).to eq(0)
    end

    it 'returns all artists when the name of parameter is not name' do
      get :search, params: { namme: "first" }
      expected_artist = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(expected_artist.size).to eq(2)
    end
  end

  describe "GET songs" do
    it 'returns http status ok' do
      get :songs, params: { id: @artist1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the founded songs' do
      get :songs, params: { id: @artist1.id }
      expected_artist = JSON.parse(response.body)
      expect(expected_artist.size).to eq(1)
    end
  end

  describe "GET albums" do
    it 'returns http status ok' do
      get :albums, params: { id: @artist2.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the founded albums' do
      get :albums, params: { id: @artist2.id }
      expected_artist = JSON.parse(response.body)
      expect(expected_artist.size).to eq(1)
    end
  end
end
