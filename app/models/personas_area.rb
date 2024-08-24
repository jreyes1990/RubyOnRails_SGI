# == Schema Information
#
# Table name: personas_areas
#
#  id              :integer          not null, primary key
#  persona_id      :integer          not null
#  area_id         :integer          not null
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class PersonasArea < ApplicationRecord
    belongs_to :area
    belongs_to :persona
    validates :persona_id, :area_id, presence: true
    validates_uniqueness_of :persona_id, :scope => :area_id, :message => " error!! solo puede asignar una vez el área"

    def nombre_area
      "#{self.area.empresa.nombre} - #{self.area.nombre} "
    end 

    def user_id
      self.persona.user_id
    end 

    def nombre_persona
      "#{self.persona.nombre} #{self.persona.apellido}"
    end 
    
end
