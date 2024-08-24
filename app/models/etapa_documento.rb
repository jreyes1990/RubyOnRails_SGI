# == Schema Information
#
# Table name: etapa_documentos
#
#  id              :integer          not null, primary key
#  nombre          :string(100)
#  descripcion     :string(255)
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class EtapaDocumento < ApplicationRecord
  validates_presence_of :nombre, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:estado], message: "El nombre que intenta registrar ya existe" }

  has_many :estado_documentos
end
