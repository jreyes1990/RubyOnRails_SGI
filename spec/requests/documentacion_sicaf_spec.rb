require 'rails_helper'

RSpec.describe "DocumentacionSicafs", type: :request do
  describe "GET /endpoint_authenticate" do
    it "returns http success" do
      get "/documentacion_sicaf/endpoint_authenticate"
      expect(response).to have_http_status(:success)
    end
  end

end
