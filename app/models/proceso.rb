# == Schema Information
#
# Table name: procesos
#
#  id               :integer          not null, primary key
#  nombre           :string(200)
#  descripcion      :string(255)
#  abreviatura      :string(5)
#  empresa_id       :integer
#  user_created_id  :integer
#  user_updated_id  :integer
#  estado           :string(10)
#  macro_proceso_id :integer          not null
#  tipo_proceso_id  :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Proceso < ApplicationRecord
  belongs_to :macro_proceso
  belongs_to :tipo_proceso
  belongs_to :empresa

  validates_presence_of :nombre, :abreviatura, :empresa_id, :tipo_proceso_id, :macro_proceso_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id, :tipo_proceso_id, :macro_proceso_id, :estado], message: "El nombre que intenta registrar ya existe" }

  has_many :actividades
  has_many :documentos
  has_many :bitacora_documentos
  has_many :permiso_documentos

  def key_proceso_compuesta
    "#{self.empresa_id}|#{self.macro_proceso_id}|#{self.id}"
  end
end
