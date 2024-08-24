require 'rails_helper'

RSpec.describe "procesos/index", type: :view do
  before(:each) do
    assign(:procesos, [
      Proceso.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        abreviatura: "Abreviatura",
        empresa_id: 2,
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado",
        macro_proceso: nil,
        tipo_proceso: nil
      ),
      Proceso.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        abreviatura: "Abreviatura",
        empresa_id: 2,
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado",
        macro_proceso: nil,
        tipo_proceso: nil
      )
    ])
  end

  it "renders a list of procesos" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: "Abreviatura".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
