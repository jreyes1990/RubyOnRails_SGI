# == Schema Information
#
# Table name: etapa_solicitudes
#
#  id              :integer          not null, primary key
#  nombre          :string(100)
#  descripcion     :string(255)
#  empresa_id      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class EtapaSolicitud < ApplicationRecord
  belongs_to :empresa

  validates_presence_of :nombre, :descripcion, :empresa_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id, :estado], message: "El nombre que intenta registrar ya existe" }

  #has_many :solicitud_cambios
end
