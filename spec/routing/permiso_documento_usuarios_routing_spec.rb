require "rails_helper"

RSpec.describe PermisoDocumentoUsuariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/permiso_documento_usuarios").to route_to("permiso_documento_usuarios#index")
    end

    it "routes to #new" do
      expect(get: "/permiso_documento_usuarios/new").to route_to("permiso_documento_usuarios#new")
    end

    it "routes to #show" do
      expect(get: "/permiso_documento_usuarios/1").to route_to("permiso_documento_usuarios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/permiso_documento_usuarios/1/edit").to route_to("permiso_documento_usuarios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/permiso_documento_usuarios").to route_to("permiso_documento_usuarios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/permiso_documento_usuarios/1").to route_to("permiso_documento_usuarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/permiso_documento_usuarios/1").to route_to("permiso_documento_usuarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/permiso_documento_usuarios/1").to route_to("permiso_documento_usuarios#destroy", id: "1")
    end
  end
end
