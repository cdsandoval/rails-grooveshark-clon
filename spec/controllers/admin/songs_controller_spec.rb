require 'rails_helper'

RSpec.describe Admin::SongsController, type: :controller do

  before do
    Song.delete_all
    @song = Song.create(  title: "How long",
                          duration: 214,
                          rating: 0,
                          progress: 0)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: @song.id}
      expect(response).to have_http_status(:success)
    end

    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params:  { id_song: @song.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http status not found' do
      get :edit, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

end
