require "rails_helper"

RSpec.describe SolicitudCambiosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/solicitud_cambios").to route_to("solicitud_cambios#index")
    end

    it "routes to #new" do
      expect(get: "/solicitud_cambios/new").to route_to("solicitud_cambios#new")
    end

    it "routes to #show" do
      expect(get: "/solicitud_cambios/1").to route_to("solicitud_cambios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/solicitud_cambios/1/edit").to route_to("solicitud_cambios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/solicitud_cambios").to route_to("solicitud_cambios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/solicitud_cambios/1").to route_to("solicitud_cambios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/solicitud_cambios/1").to route_to("solicitud_cambios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/solicitud_cambios/1").to route_to("solicitud_cambios#destroy", id: "1")
    end
  end
end
