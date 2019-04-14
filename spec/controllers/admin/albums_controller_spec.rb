require 'rails_helper'

RSpec.describe Admin::AlbumsController, type: :controller do

  before do
    Album.delete_all
    @album1 = Album.create( title: "Nuevo album",
                            rating: 0)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: @album1.id}
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
      get :edit, params:  { id: @album1.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http status not found' do
      get :edit, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

end
