# == Schema Information
#
# Table name: tipo_sistemas
#
#  id              :integer          not null, primary key
#  nombre          :string(200)
#  descripcion     :string(255)
#  abreviatura     :string(5)
#  empresa_id      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class TipoSistema < ApplicationRecord
  belongs_to :empresa

  validates_presence_of :nombre, :abreviatura, :empresa_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id, :estado], message: "El nombre que intenta registrar ya existe" }

  has_many :documentos
  has_many :bitacora_documentos
  has_many :permiso_documentos
end
