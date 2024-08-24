require 'rails_helper'

RSpec.describe "permiso_documento_usuarios/edit", type: :view do
  before(:each) do
    @permiso_documento_usuario = assign(:permiso_documento_usuario, PermisoDocumentoUsuario.create!(
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      user: nil,
      permiso_documento: nil
    ))
  end

  it "renders the edit permiso_documento_usuario form" do
    render

    assert_select "form[action=?][method=?]", permiso_documento_usuario_path(@permiso_documento_usuario), "post" do

      assert_select "input[name=?]", "permiso_documento_usuario[user_created_id]"

      assert_select "input[name=?]", "permiso_documento_usuario[user_updated_id]"

      assert_select "input[name=?]", "permiso_documento_usuario[estado]"

      assert_select "input[name=?]", "permiso_documento_usuario[user_id]"

      assert_select "input[name=?]", "permiso_documento_usuario[permiso_documento_id]"
    end
  end
end
