require 'rails_helper'

RSpec.describe "procesos/edit", type: :view do
  before(:each) do
    @proceso = assign(:proceso, Proceso.create!(
      nombre: "MyString",
      descripcion: "MyString",
      abreviatura: "MyString",
      empresa_id: 1,
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      macro_proceso: nil,
      tipo_proceso: nil
    ))
  end

  it "renders the edit proceso form" do
    render

    assert_select "form[action=?][method=?]", proceso_path(@proceso), "post" do

      assert_select "input[name=?]", "proceso[nombre]"

      assert_select "input[name=?]", "proceso[descripcion]"

      assert_select "input[name=?]", "proceso[abreviatura]"

      assert_select "input[name=?]", "proceso[empresa_id]"

      assert_select "input[name=?]", "proceso[user_created_id]"

      assert_select "input[name=?]", "proceso[user_updated_id]"

      assert_select "input[name=?]", "proceso[estado]"

      assert_select "input[name=?]", "proceso[macro_proceso_id]"

      assert_select "input[name=?]", "proceso[tipo_proceso_id]"
    end
  end
end
