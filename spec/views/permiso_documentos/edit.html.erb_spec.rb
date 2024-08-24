require 'rails_helper'

RSpec.describe "permiso_documentos/edit", type: :view do
  before(:each) do
    @permiso_documento = assign(:permiso_documento, PermisoDocumento.create!(
      tipo_usuario_id: 1,
      proceso_id: 1,
      tipo_sistema_id: 1,
      documento_id: 1,
      todo: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders the edit permiso_documento form" do
    render

    assert_select "form[action=?][method=?]", permiso_documento_path(@permiso_documento), "post" do

      assert_select "input[name=?]", "permiso_documento[tipo_usuario_id]"

      assert_select "input[name=?]", "permiso_documento[proceso_id]"

      assert_select "input[name=?]", "permiso_documento[tipo_sistema_id]"

      assert_select "input[name=?]", "permiso_documento[documento_id]"

      assert_select "input[name=?]", "permiso_documento[todo]"

      assert_select "input[name=?]", "permiso_documento[user_created_id]"

      assert_select "input[name=?]", "permiso_documento[user_updated_id]"

      assert_select "input[name=?]", "permiso_documento[estado]"
    end
  end
end
