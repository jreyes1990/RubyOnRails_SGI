require 'rails_helper'

RSpec.describe "permiso_documentos/show", type: :view do
  before(:each) do
    @permiso_documento = assign(:permiso_documento, PermisoDocumento.create!(
      tipo_usuario_id: 2,
      proceso_id: 3,
      tipo_sistema_id: 4,
      documento_id: 5,
      todo: "Todo",
      user_created_id: 6,
      user_updated_id: 7,
      estado: "Estado"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Todo/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/Estado/)
  end
end
