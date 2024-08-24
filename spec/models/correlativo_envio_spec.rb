# == Schema Information
#
# Table name: correlativo_envios
#
#  id               :bigint           not null, primary key
#  orden_trabajo_id :integer
#  numero_copia     :integer
#  user_id          :integer
#  realizado        :string
#  correlativo      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe CorrelativoEnvio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
