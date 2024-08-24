require "rails_helper"

RSpec.describe EtapaSolicitudesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/etapa_solicitudes").to route_to("etapa_solicitudes#index")
    end

    it "routes to #new" do
      expect(get: "/etapa_solicitudes/new").to route_to("etapa_solicitudes#new")
    end

    it "routes to #show" do
      expect(get: "/etapa_solicitudes/1").to route_to("etapa_solicitudes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/etapa_solicitudes/1/edit").to route_to("etapa_solicitudes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/etapa_solicitudes").to route_to("etapa_solicitudes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/etapa_solicitudes/1").to route_to("etapa_solicitudes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/etapa_solicitudes/1").to route_to("etapa_solicitudes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/etapa_solicitudes/1").to route_to("etapa_solicitudes#destroy", id: "1")
    end
  end
end
