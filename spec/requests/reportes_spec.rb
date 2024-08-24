require 'rails_helper'

RSpec.describe "Reportes", type: :request do
  describe "GET /reporte_asignacion" do
    it "returns http success" do
      get "/reportes/reporte_asignacion"
      expect(response).to have_http_status(:success)
    end
  end

end
