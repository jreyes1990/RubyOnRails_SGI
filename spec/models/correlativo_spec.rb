# == Schema Information
#
# Table name: correlativos
#
#  id               :bigint           not null, primary key
#  orden_trabajo_id :integer
#  fecha_año        :string
#  numero_copias    :integer
#  user_id          :integer
#  realizado        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  correlativo      :integer
#
require 'rails_helper'

RSpec.describe Correlativo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
