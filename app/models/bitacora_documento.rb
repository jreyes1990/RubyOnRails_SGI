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
class BitacoraDocumento < ApplicationRecord
  belongs_to :empresa
  belongs_to :proceso
  belongs_to :tipo_sistema
  belongs_to :tipo_documento
  belongs_to :estado_documento
  belongs_to :documento

  validates :correlativo, uniqueness: {case_sensitive: false, scope: [:codigo, :nombre, :version, :empresa_id, :proceso_id, :estado_documento_id, :proceso_id, :tipo_sistema, :tipo_documento_id, :estado], message: "El nombre que intenta registrar ya existe" }
end
