# == Schema Information
#
# Table name: proveedores
#
#  id                :bigint           not null, primary key
#  nombre            :string
#  direccion         :string
#  telefono_empresa  :integer
#  extension         :integer
#  nombre_contacto   :string
#  telefono_contacto :integer
#  descripcion       :string
#  estado            :string
#  area_id           :integer
#  user_created_id   :integer
#  user_updated_id    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Proveedor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
