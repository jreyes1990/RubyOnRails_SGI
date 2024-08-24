# == Schema Information
#
# Table name: areas
#
#  id              :integer          not null, primary key
#  nombre          :string(255)
#  descripcion     :string(255)
#  empresa_id      :integer          not null
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Area < ApplicationRecord
  validates :nombre, :descripcion, :empresa_id, presence: true
  belongs_to :empresa



  def nombre_area_empresa
    "#{self.empresa.nombre.upcase} - #{self.nombre.upcase}"
  end

  def nombre_con_codigo
    "#{self.id} | ÁREA: #{self.nombre.upcase}" 
  end
 
end
