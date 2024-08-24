require 'rails_helper'

RSpec.describe "documentos/show", type: :view do
  before(:each) do
    @documento = assign(:documento, Documento.create!(
      codigo: "Codigo",
      correlativo: 2,
      nombre: "Nombre",
      version: 3,
      descripcion: "Descripcion",
      empresa_id: 4,
      estado_documento_id: 5,
      user_created_id: 6,
      user_updated_id: 7,
      estado: "Estado",
      proceso: nil,
      tipo_sistema: nil,
      tipo_documento: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
