require 'rails_helper'

RSpec.describe "tipo_procesos/new", type: :view do
  before(:each) do
    assign(:tipo_proceso, TipoProceso.new(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new tipo_proceso form" do
    render

    assert_select "form[action=?][method=?]", tipo_procesos_path, "post" do

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
