require "rails_helper"

RSpec.describe TipoProcesosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tipo_procesos").to route_to("tipo_procesos#index")
    end

    it "routes to #new" do
      expect(get: "/tipo_procesos/new").to route_to("tipo_procesos#new")
    end

    it "routes to #show" do
      expect(get: "/tipo_procesos/1").to route_to("tipo_procesos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tipo_procesos/1/edit").to route_to("tipo_procesos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tipo_procesos").to route_to("tipo_procesos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tipo_procesos/1").to route_to("tipo_procesos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tipo_procesos/1").to route_to("tipo_procesos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tipo_procesos/1").to route_to("tipo_procesos#destroy", id: "1")
    end
  end
end
