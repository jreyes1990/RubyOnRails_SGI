require "rails_helper"

RSpec.describe EstadoDocumentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/estado_documentos").to route_to("estado_documentos#index")
    end

    it "routes to #new" do
      expect(get: "/estado_documentos/new").to route_to("estado_documentos#new")
    end

    it "routes to #show" do
      expect(get: "/estado_documentos/1").to route_to("estado_documentos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/estado_documentos/1/edit").to route_to("estado_documentos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/estado_documentos").to route_to("estado_documentos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/estado_documentos/1").to route_to("estado_documentos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/estado_documentos/1").to route_to("estado_documentos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/estado_documentos/1").to route_to("estado_documentos#destroy", id: "1")
    end
  end
end
