require 'rails_helper'

RSpec.describe Api::AlbumsController, type: :controller do

  before do
    Album.delete_all
    Song.delete_all
    Artist.delete_all
    @song1 = Song.create( title: "How long",
                          duration: 214,
                          progress: 0)
    @album1 = Album.create( title: "Nuevo album"
                            )
    @artist1 = Artist.create(  name: "Juanes",
                              age: "35")
    @album1.songs << @song1
    @album1.artists << @artist1

    @song2 = Song.create( title: "You have done for me",
                          duration: 267,
                          progress: 0)
    @album2 = Album.create( title: "Nuevo album2"
                            )
    @artist2 = Artist.create(  name: "Shakira",
                              age: "46")
    @album2.songs << @song2
    @album2.artists << @artist2

    @song3 = Song.create( title: "The long son",
                          duration: 273,
                          progress: 0)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'render json with all albums' do
      get :index
      albums = JSON.parse(response.body)
      expect(albums.size).to eq 2
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @album1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct album' do
      get :show, params: { id: @album1.id }
      expected_album = JSON.parse(response.body)
      expect(expected_album["id"]).to eq(@album1.id)
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

    it 'render the founded albums' do
      get :search, params: { title: "Nuevo" }
      expected_album = JSON.parse(response.body)
      expect(expected_album.size).to eq(2)
    end

    it 'returns http status ok when there no founded albums' do
      get :search, params: { title: "first" }
      expected_album = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(expected_album.size).to eq(0)
    end

    it 'returns all albums when the name of parameter is not title' do
      get :search, params: { tittle: "first" }
      expected_album = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(expected_album.size).to eq(2)
    end
  end

  describe "GET songs" do
    it 'returns http status ok' do
      get :songs, params: { id: @album1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the founded songs' do
      get :songs, params: { id: @album1.id }
      expected_album = JSON.parse(response.body)
      expect(expected_album.size).to eq(1)
    end
  end

  describe "GET artists" do
    it 'returns http status ok' do
      get :artists, params: { id: @album1.id }
      expect(response).to have_http_status(:ok)
    end

    it 'render the founded artists' do
      get :artists, params: { id: @album1.id }
      expected_album = JSON.parse(response.body)
      expect(expected_album.size).to eq(1)
    end
  end

  # describe 'PUT rating' do
  #   it 'returns http status ok' do
  #     get :album_rating, params: { id: @album1.id, rating: 1 }
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it 'returns http status bad request' do
  #     get :album_rating, params: { id: @album1.id, rating: 20 }
  #     expected_album = JSON.parse(response.body)
  #     expect(response).to have_http_status(:bad_request)
  #     expect(expected_album["message"]).to eq("The value of rating has to be -1, 0 or 1")
  #   end

  #   it 'returns http status bad request when the name of parameter is not rating' do
  #     get :album_rating, params: { id: @album1.id, ratin: 100 }
  #     expected_album = JSON.parse(response.body)
  #     expect(response).to have_http_status(:bad_request)
  #     expect(expected_album["message"]).to eq("This request has to have the parameters id and rating")
  #   end

  #   it 'returns a message from updated album' do
  #     get :album_rating, params: { id: @album1.id, rating: -1 }
  #     expected_album = JSON.parse(response.body)
  #     expect(expected_album["message"]).to eq("Update successfully rating album")
  #   end
  # end

end
