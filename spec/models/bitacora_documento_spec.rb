# == Schema Information
#
# Table name: bitacora_documentos
#
#  id                  :integer          not null, primary key
#  codigo              :string(20)
#  correlativo         :integer
#  nombre              :string(200)
#  fecha_vigencia      :date
#  version             :integer
#  descripcion         :string(255)
#  empresa_id          :integer
#  proceso_id          :integer
#  tipo_sistema_id     :integer
#  tipo_documento_id   :integer
#  estado_documento_id :integer
#  user_created_id     :integer
#  user_updated_id     :integer
#  estado              :string(10)
#  documento_id        :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe BitacoraDocumento, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
