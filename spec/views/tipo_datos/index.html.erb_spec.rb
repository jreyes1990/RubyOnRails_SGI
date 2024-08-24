require 'rails_helper'

RSpec.describe "tipo_datos/index", type: :view do
  before(:each) do
    assign(:tipo_datos, [
      TipoDato.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado"
      ),
      TipoDato.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado"
      )
    ])
  end

  it "renders a list of tipo_datos" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
  end
end
