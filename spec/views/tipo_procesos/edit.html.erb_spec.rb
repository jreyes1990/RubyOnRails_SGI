require 'rails_helper'

RSpec.describe "tipo_procesos/edit", type: :view do
  before(:each) do
    @tipo_proceso = assign(:tipo_proceso, TipoProceso.create!(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders the edit tipo_proceso form" do
    render

    assert_select "form[action=?][method=?]", tipo_proceso_path(@tipo_proceso), "post" do

      assert_select "input[name=?]", "tipo_proceso[nombre]"

      assert_select "input[name=?]", "tipo_proceso[descripcion]"

      assert_select "input[name=?]", "tipo_proceso[abreviatura]"

      assert_select "input[name=?]", "tipo_proceso[empresa_id]"

      assert_select "input[name=?]", "tipo_proceso[user_created_id]"

      assert_select "input[name=?]", "tipo_proceso[user_updated_id]"

      assert_select "input[name=?]", "tipo_proceso[estado]"
    end
  end
end
