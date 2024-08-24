require "rails_helper"

RSpec.describe TipoSistemasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tipo_sistemas").to route_to("tipo_sistemas#index")
    end

    it "routes to #new" do
      expect(get: "/tipo_sistemas/new").to route_to("tipo_sistemas#new")
    end

    it "routes to #show" do
      expect(get: "/tipo_sistemas/1").to route_to("tipo_sistemas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tipo_sistemas/1/edit").to route_to("tipo_sistemas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tipo_sistemas").to route_to("tipo_sistemas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tipo_sistemas/1").to route_to("tipo_sistemas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tipo_sistemas/1").to route_to("tipo_sistemas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tipo_sistemas/1").to route_to("tipo_sistemas#destroy", id: "1")
    end
  end
end
