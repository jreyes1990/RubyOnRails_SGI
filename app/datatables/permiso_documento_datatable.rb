class PermisoDocumentoDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include Utilidades
  include Permisos
  include PermisoDocumentosHelper

  #Definición de los Helpers de la vista
  def_delegator :@view, :link_to
  def_delegator :@view, :tiene_permiso
  def_delegator :@view, :check_box_tag

  def initialize(params, opts = {})
    @view = opts[:view_context]
    @clasifica_documento_id = opts[:clasifica_documento_id]
    super
  end

  def view_columns
    @view_columns ||= {
      sistema: { source: "PermisoDocumento.tipo_sistema_id", cond: :like },
      proceso: { source: "PermisoDocumento.proceso_id", cond: :like },
      tipo_documento: { source: "PermisoDocumento.tipo_documento_id", cond: :like },
      documento: { source: "PermisoDocumento.documento_id", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        sistema: encabezado_columna('fas fa-folder-plus', record.nombre_sistema.upcase),
        proceso: encabezado_columna('fas fa-folder', record.nombre_proceso.upcase),
        tipo_documento: encabezado_columna('fas fa-folder-open', record.nombre_tipo_documento.upcase),
        documento: encabezado_documento('far fa-file-pdf', record)
      }
    end
  end

  def get_raw_records
      
    PermisoDocumento.joins("INNER JOIN TIPO_USUARIOS ON(PERMISO_DOCUMENTOS.TIPO_USUARIO_ID=TIPO_USUARIOS.ID)
                            INNER JOIN TIPO_SISTEMAS ON(PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID=TIPO_SISTEMAS.ID)
                            INNER JOIN PROCESOS ON(PERMISO_DOCUMENTOS.PROCESO_ID=PROCESOS.ID)
                            INNER JOIN TIPO_DOCUMENTOS ON(PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID=TIPO_DOCUMENTOS.ID)
                            INNER JOIN DOCUMENTOS ON(PERMISO_DOCUMENTOS.DOCUMENTO_ID=DOCUMENTOS.ID)
                            INNER JOIN MACRO_PROCESOS ON(PROCESOS.MACRO_PROCESO_ID=MACRO_PROCESOS.ID)
                            INNER JOIN TIPO_PROCESOS  ON(PROCESOS.TIPO_PROCESO_ID=TIPO_PROCESOS.ID)")
                    .select("PERMISO_DOCUMENTOS.ID,
                            PERMISO_DOCUMENTOS.TIPO_USUARIO_ID,
                            TIPO_USUARIOS.NOMBRE AS NOMBRE_CLASIFICA_DOCUMENTO,
                            PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID,
                            TIPO_SISTEMAS.NOMBRE AS nombre_sistema,
                            PERMISO_DOCUMENTOS.PROCESO_ID,
                            PROCESOS.NOMBRE AS nombre_proceso,
                            PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID,
                            TIPO_DOCUMENTOS.NOMBRE AS nombre_tipo_documento,
                            PERMISO_DOCUMENTOS.DOCUMENTO_ID,
                            DOCUMENTOS.CODIGO AS CODIGO_DOCUMENTO,
                            DOCUMENTOS.CORRELATIVO  AS CORRELATIVO_DOCUMENTO,
                            DOCUMENTOS.NOMBRE  AS nombre_documento,
                            DOCUMENTOS.FECHA_VIGENCIA  AS FECHA_DOCUMENTO,
                            DOCUMENTOS.VERSION  AS VERSION_DOCUMENTO,
                            PROCESOS.MACRO_PROCESO_ID,
                            MACRO_PROCESOS.NOMBRE AS NOMBRE_MACRO_PROCESO,
                            PROCESOS.TIPO_PROCESO_ID,
                            TIPO_PROCESOS.NOMBRE AS NOMBRE_TIPO_PROCESO,
                            PERMISO_DOCUMENTOS.ESTADO")
                    .where("permiso_documentos.tipo_usuario_id = ?",@clasifica_documento_id)
  end
end
