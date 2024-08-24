# == Schema Information
#
# Table name: empresas
#
#  id              :integer          not null, primary key
#  nombre          :string(255)
#  descripcion     :string(255)
#  codigo_empresa  :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Empresa < ApplicationRecord
    validates_presence_of :nombre, :descripcion, :codigo_empresa, message: ": este campo es obligatorio"    
    validates :nombre, uniqueness: {case_sensitive: false, scope: :estado, message: "El nombre que intenta registrar ya existe" }

    has_many :areas, dependent: :destroy
    has_many :tipo_procesos, dependent: :destroy
    has_many :tipo_usuarios, dependent: :destroy
    has_many :tipo_sistemas, dependent: :destroy
    has_many :tipo_documentos, dependent: :destroy
    has_many :macro_procesos, dependent: :destroy
    has_many :etapa_solicitudes, dependent: :destroy
    has_many :estado_documentos, dependent: :destroy
    has_many :procesos, dependent: :destroy
    has_many :actividades, dependent: :destroy
    has_many :usuario_procesos, dependent: :destroy
    has_many :documentos, dependent: :destroy
    has_many :bitacora_documentos
    
    def informacion_empresa
      "CÓDIGO: " + "#{self.id}" + " #{self.nombre.upcase}" 
    end

    def empresa_con_codigo
      "#{self.id} | #{self.nombre.upcase}" 
    end
end
