require 'rails_helper'

RSpec.describe "ClonarCatalogos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/clonar_catalogos/index"
      expect(response).to have_http_status(:success)
    end
  end

end
