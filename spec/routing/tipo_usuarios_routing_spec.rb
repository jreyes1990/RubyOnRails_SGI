require "rails_helper"

RSpec.describe TipoUsuariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tipo_usuarios").to route_to("tipo_usuarios#index")
    end

    it "routes to #new" do
      expect(get: "/tipo_usuarios/new").to route_to("tipo_usuarios#new")
    end

    it "routes to #show" do
      expect(get: "/tipo_usuarios/1").to route_to("tipo_usuarios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tipo_usuarios/1/edit").to route_to("tipo_usuarios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tipo_usuarios").to route_to("tipo_usuarios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tipo_usuarios/1").to route_to("tipo_usuarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tipo_usuarios/1").to route_to("tipo_usuarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tipo_usuarios/1").to route_to("tipo_usuarios#destroy", id: "1")
    end
  end
end
