# == Schema Information
#
# Table name: tipo_usuarios
#
#  id              :integer          not null, primary key
#  nombre          :string(100)
#  descripcion     :string(255)
#  empresa_id      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(100)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class TipoUsuario < ApplicationRecord
  belongs_to :empresa

  has_many :permiso_documentos

  validates_presence_of :nombre, :empresa_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id, :estado], message: "El nombre que intenta registrar ya existe" }
end
