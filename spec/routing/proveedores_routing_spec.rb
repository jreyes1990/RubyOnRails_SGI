require "rails_helper"

RSpec.describe ProveedoresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/proveedores").to route_to("proveedores#index")
    end

    it "routes to #new" do
      expect(get: "/proveedores/new").to route_to("proveedores#new")
    end

    it "routes to #show" do
      expect(get: "/proveedores/1").to route_to("proveedores#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/proveedores/1/edit").to route_to("proveedores#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/proveedores").to route_to("proveedores#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/proveedores/1").to route_to("proveedores#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/proveedores/1").to route_to("proveedores#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/proveedores/1").to route_to("proveedores#destroy", id: "1")
    end
  end
end
