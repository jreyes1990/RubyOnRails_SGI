# == Schema Information
#
# Table name: parametros
#
#  id                  :integer          not null, primary key
#  user_id             :integer          not null
#  view_default        :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  area_id             :decimal(, )
#  nombre_area         :string(500)
#  empresa_id          :decimal(, )
#  nombre_empresa      :string(500)
#  ruta_predeterminada :string(100)
#
class Parametro < ApplicationRecord
  belongs_to :user
  belongs_to :area
end
