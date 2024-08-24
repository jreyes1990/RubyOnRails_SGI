require "rails_helper"

RSpec.describe EtapaDocumentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/etapa_documentos").to route_to("etapa_documentos#index")
    end

    it "routes to #new" do
      expect(get: "/etapa_documentos/new").to route_to("etapa_documentos#new")
    end

    it "routes to #show" do
      expect(get: "/etapa_documentos/1").to route_to("etapa_documentos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/etapa_documentos/1/edit").to route_to("etapa_documentos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/etapa_documentos").to route_to("etapa_documentos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/etapa_documentos/1").to route_to("etapa_documentos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/etapa_documentos/1").to route_to("etapa_documentos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/etapa_documentos/1").to route_to("etapa_documentos#destroy", id: "1")
    end
  end
end
