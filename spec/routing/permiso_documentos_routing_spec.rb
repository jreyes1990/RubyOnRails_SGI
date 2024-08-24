require "rails_helper"

RSpec.describe PermisoDocumentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/permiso_documentos").to route_to("permiso_documentos#index")
    end

    it "routes to #new" do
      expect(get: "/permiso_documentos/new").to route_to("permiso_documentos#new")
    end

    it "routes to #show" do
      expect(get: "/permiso_documentos/1").to route_to("permiso_documentos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/permiso_documentos/1/edit").to route_to("permiso_documentos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/permiso_documentos").to route_to("permiso_documentos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/permiso_documentos/1").to route_to("permiso_documentos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/permiso_documentos/1").to route_to("permiso_documentos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/permiso_documentos/1").to route_to("permiso_documentos#destroy", id: "1")
    end
  end
end
