require 'rails_helper'

RSpec.describe "BitacoraDocumentos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/bitacora_documentos/index"
      expect(response).to have_http_status(:success)
    end
  end

end
