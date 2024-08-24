# == Schema Information
#
# Table name: tipo_datos
#
#  id             :bigint           not null, primary key
#  nombre         :string
#  descripcion    :string
#  user_created_id :integer
#  user_updated_id :integer
#  estado         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe TipoDato, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
