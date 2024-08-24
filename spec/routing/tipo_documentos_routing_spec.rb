require "rails_helper"

RSpec.describe TipoDocumentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tipo_documentos").to route_to("tipo_documentos#index")
    end

    it "routes to #new" do
      expect(get: "/tipo_documentos/new").to route_to("tipo_documentos#new")
    end

    it "routes to #show" do
      expect(get: "/tipo_documentos/1").to route_to("tipo_documentos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tipo_documentos/1/edit").to route_to("tipo_documentos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tipo_documentos").to route_to("tipo_documentos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tipo_documentos/1").to route_to("tipo_documentos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tipo_documentos/1").to route_to("tipo_documentos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tipo_documentos/1").to route_to("tipo_documentos#destroy", id: "1")
    end
  end
end
