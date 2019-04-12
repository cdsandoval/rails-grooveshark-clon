require 'rails_helper'

RSpec.describe Api::ArtistsController, type: :controller do
  before do
    @artist = Artist.create(name: "Juanes",age: "35")
  end

  describe "GET index" do
    it "returns http ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "render Json with all artists" do
      get :index
      artist = JSON.parse(response.body)
      expect(artist.size).to eq 1
    end
  end



end
