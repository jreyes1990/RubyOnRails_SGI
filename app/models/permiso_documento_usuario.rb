# == Schema Information
#
# Table name: permiso_documento_usuarios
#
#  id                   :integer          not null, primary key
#  user_created_id      :integer
#  user_updated_id      :integer
#  estado               :string(10)
#  user_id              :integer          not null
#  permiso_documento_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class PermisoDocumentoUsuario < ApplicationRecord
  belongs_to :user
  belongs_to :permiso_documento

  validates_presence_of :user_id, :permiso_documento_id, message: ": este campo es obligatorio"
  validates :user_id, uniqueness: {case_sensitive: false, scope: [:permiso_documento_id, :estado], message: "El permiso que intenta registrar ya existe" }


  def permiso_docto
    "#{self.desc_permiso_docto}"
  end
end
