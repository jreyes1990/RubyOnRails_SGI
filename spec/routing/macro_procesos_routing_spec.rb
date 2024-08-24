require "rails_helper"

RSpec.describe MacroProcesosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/macro_procesos").to route_to("macro_procesos#index")
    end

    it "routes to #new" do
      expect(get: "/macro_procesos/new").to route_to("macro_procesos#new")
    end

    it "routes to #show" do
      expect(get: "/macro_procesos/1").to route_to("macro_procesos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/macro_procesos/1/edit").to route_to("macro_procesos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/macro_procesos").to route_to("macro_procesos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/macro_procesos/1").to route_to("macro_procesos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/macro_procesos/1").to route_to("macro_procesos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/macro_procesos/1").to route_to("macro_procesos#destroy", id: "1")
    end
  end
end
