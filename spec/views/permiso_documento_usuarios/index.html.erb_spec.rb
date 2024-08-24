require 'rails_helper'

RSpec.describe "permiso_documento_usuarios/index", type: :view do
  before(:each) do
    assign(:permiso_documento_usuarios, [
      PermisoDocumentoUsuario.create!(
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado",
        user: nil,
        permiso_documento: nil
      ),
      PermisoDocumentoUsuario.create!(
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado",
        user: nil,
        permiso_documento: nil
      )
    ])
  end

  it "renders a list of permiso_documento_usuarios" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
