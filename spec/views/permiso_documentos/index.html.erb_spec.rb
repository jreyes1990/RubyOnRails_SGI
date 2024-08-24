require 'rails_helper'

RSpec.describe "permiso_documentos/index", type: :view do
  before(:each) do
    assign(:permiso_documentos, [
      PermisoDocumento.create!(
        tipo_usuario_id: 2,
        proceso_id: 3,
        tipo_sistema_id: 4,
        documento_id: 5,
        todo: "Todo",
        user_created_id: 6,
        user_updated_id: 7,
        estado: "Estado"
      ),
      PermisoDocumento.create!(
        tipo_usuario_id: 2,
        proceso_id: 3,
        tipo_sistema_id: 4,
        documento_id: 5,
        todo: "Todo",
        user_created_id: 6,
        user_updated_id: 7,
        estado: "Estado"
      )
    ])
  end

  it "renders a list of permiso_documentos" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: "Todo".to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
  end
end
