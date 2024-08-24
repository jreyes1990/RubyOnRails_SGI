require "rails_helper"

RSpec.describe SeguimientoSolicitudesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/seguimiento_solicitudes").to route_to("seguimiento_solicitudes#index")
    end

    it "routes to #new" do
      expect(get: "/seguimiento_solicitudes/new").to route_to("seguimiento_solicitudes#new")
    end

    it "routes to #show" do
      expect(get: "/seguimiento_solicitudes/1").to route_to("seguimiento_solicitudes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/seguimiento_solicitudes/1/edit").to route_to("seguimiento_solicitudes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/seguimiento_solicitudes").to route_to("seguimiento_solicitudes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/seguimiento_solicitudes/1").to route_to("seguimiento_solicitudes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/seguimiento_solicitudes/1").to route_to("seguimiento_solicitudes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/seguimiento_solicitudes/1").to route_to("seguimiento_solicitudes#destroy", id: "1")
    end
  end
end
