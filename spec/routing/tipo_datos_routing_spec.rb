require "rails_helper"

RSpec.describe TipoDatosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tipo_datos").to route_to("tipo_datos#index")
    end

    it "routes to #new" do
      expect(get: "/tipo_datos/new").to route_to("tipo_datos#new")
    end

    it "routes to #show" do
      expect(get: "/tipo_datos/1").to route_to("tipo_datos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tipo_datos/1/edit").to route_to("tipo_datos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tipo_datos").to route_to("tipo_datos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tipo_datos/1").to route_to("tipo_datos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tipo_datos/1").to route_to("tipo_datos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tipo_datos/1").to route_to("tipo_datos#destroy", id: "1")
    end
  end
end
