# == Schema Information
#
# Table name: actividades
#
#  id              :integer          not null, primary key
#  nombre          :string(200)
#  descripcion     :string(255)
#  empresa_id      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  proceso_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Actividad < ApplicationRecord
  belongs_to :proceso
  belongs_to :empresa

  validates_presence_of :nombre, :empresa_id, :proceso_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id, :proceso_id, :estado], message: "El nombre que intenta registrar ya existe" }
end
