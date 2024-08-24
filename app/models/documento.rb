# == Schema Information
#
# Table name: documentos
#
#  id                  :integer          not null, primary key
#  codigo              :string(20)
#  correlativo         :integer
#  nombre              :string(200)
#  fecha_vigencia      :date
#  version             :integer
#  descripcion         :string(255)
#  empresa_id          :integer
#  estado_documento_id :integer
#  user_created_id     :integer
#  user_updated_id     :integer
#  estado              :string(10)
#  proceso_id          :integer          not null
#  tipo_sistema_id     :integer          not null
#  tipo_documento_id   :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Documento < ApplicationRecord
  belongs_to :empresa
  belongs_to :proceso
  belongs_to :tipo_sistema
  belongs_to :tipo_documento
  belongs_to :estado_documento

  validates_presence_of :codigo, :correlativo, :nombre, :fecha_vigencia, :version, :empresa_id, :proceso_id, :tipo_sistema, :tipo_documento_id, :estado_documento_id, message: ": este campo es obligatorio"
  validates :correlativo, uniqueness: {case_sensitive: false, scope: [:codigo, :version, :empresa_id, :proceso_id, :tipo_sistema, :tipo_documento_id, :estado_documento_id, :estado], message: "El correlativo que intenta registrar ya existe" }

  has_many :bitacora_documentos
  has_many :solicitud_cambios
  has_many :permiso_documentos

  has_one_attached :file_pdf
  has_one_attached :file_word
  has_one_attached :file_excel
  has_one_attached :file_word_preview
  has_one_attached :file_excel_preview

  #validates :file_pdf, attached: true, content_type: { in: 'application/pdf', message: 'El archivo NO es un PDF' }
  #validates :file_word, attached: true, content_type: { in: %w[application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document], message: 'El archivo NO es un WORD' }

  def informacion_documento
    if self.codigo.nil?
      "#{self.nombre}"
    else
      "#{self.codigo}#{self.correlativo}: #{self.nombre}"
    end

  end
end
