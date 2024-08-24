require 'rails_helper'

RSpec.describe "macro_procesos/new", type: :view do
  before(:each) do
    assign(:macro_proceso, MacroProceso.new(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new macro_proceso form" do
    render

    assert_select "form[action=?][method=?]", macro_procesos_path, "post" do

      assert_select "input[name=?]", "macro_proceso[nombre]"

      assert_select "input[name=?]", "macro_proceso[descripcion]"

      assert_select "input[name=?]", "macro_proceso[abreviatura]"

      assert_select "input[name=?]", "macro_proceso[empresa_id]"

      assert_select "input[name=?]", "macro_proceso[user_created_id]"

      assert_select "input[name=?]", "macro_proceso[user_updated_id]"

      assert_select "input[name=?]", "macro_proceso[estado]"
    end
  end
end
