# == Schema Information
#
# Table name: detalle_tipo_datos
#
#  id                :bigint           not null, primary key
#  caracteristica_id :bigint           not null
#  valor_nivel       :string
#  estado            :string
#  user_created_id    :integer
#  user_updated_id    :integer
#  area_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe DetalleTipoDato, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
