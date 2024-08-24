require 'rails_helper'

RSpec.describe "permiso_documento_usuarios/show", type: :view do
  before(:each) do
    @permiso_documento_usuario = assign(:permiso_documento_usuario, PermisoDocumentoUsuario.create!(
      user_created_id: 2,
      user_updated_id: 3,
      estado: "Estado",
      user: nil,
      permiso_documento: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
