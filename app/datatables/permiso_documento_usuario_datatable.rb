class PermisoDocumentoUsuarioDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include Utilidades
  include Permisos
  include PermisoDocumentoUsuariosHelper

  #Definición de los Helpers de la vista
  def_delegator :@view, :link_to
  def_delegator :@view, :tiene_permiso
  def_delegator :@view, :check_box_tag

  def initialize(params, opts = {})
    @view = opts[:view_context]
    @usuario_permiso_documento_id = opts[:usuario_permiso_documento_id]
    super
  end

  def view_columns
    @view_columns ||= {
      clasifica_documento: { source: "PermisoDocumento.tipo_usuario_id", cond: :like },
      usuario_sistema: { source: "PermisoDocumento.tipo_sistema_id", cond: :like },
      usuario_proceso: { source: "PermisoDocumento.proceso_id", cond: :like },
      usuario_tipo_documento: { source: "PermisoDocumento.tipo_documento_id", cond: :like },
      usuario_documento: { source: "PermisoDocumento.documento_id", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        clasifica_documento: usuario_encabezado_columna('fas fa-user', record.nombre_clasifica_documento.upcase),
        usuario_sistema: usuario_encabezado_columna('fas fa-folder-plus', record.nombre_sistema.upcase),
        usuario_proceso: usuario_encabezado_columna('fas fa-folder', record.nombre_proceso.upcase),
        usuario_tipo_documento: usuario_encabezado_columna('fas fa-folder-open', record.nombre_tipo_documento.upcase),
        usuario_documento: usuario_encabezado_documento('far fa-file-pdf', record)
      }
    end
  end

  def get_raw_records
    PermisoDocumentoUsuario.joins("INNER JOIN PERMISO_DOCUMENTOS ON(PERMISO_DOCUMENTO_USUARIOS.PERMISO_DOCUMENTO_ID=PERMISO_DOCUMENTOS.ID)
                            INNER JOIN TIPO_USUARIOS ON(PERMISO_DOCUMENTOS.TIPO_USUARIO_ID=TIPO_USUARIOS.ID)
                            INNER JOIN TIPO_SISTEMAS ON(PERMISO_DOCUMENTOS.TIPO_SISTEMA_ID=TIPO_SISTEMAS.ID)
                            INNER JOIN PROCESOS ON(PERMISO_DOCUMENTOS.PROCESO_ID=PROCESOS.ID)
                            INNER JOIN TIPO_DOCUMENTOS ON(PERMISO_DOCUMENTOS.TIPO_DOCUMENTO_ID=TIPO_DOCUMENTOS.ID)
                            INNER JOIN DOCUMENTOS ON(PERMISO_DOCUMENTOS.DOCUMENTO_ID=DOCUMENTOS.ID)
                            INNER JOIN MACRO_PROCESOS ON(PROCESOS.MACRO_PROCESO_ID=MACRO_PROCESOS.ID)
                            INNER JOIN TIPO_PROCESOS  ON(PROCESOS.TIPO_PROCESO_ID=TIPO_PROCESOS.ID)")
                           .select("
                            PERMISO_DOCUMENTO_USUARIOS.ID,
                            PERMISO_DOCUMENTO_USUARIOS.PERMISO_DOCUMENTO_ID,
                            PERMISO_DOCUMENTO_USUARIOS.user_id,
                            PERMISO_DOCUMENTOS.TIPO_USUARIO_ID,
                            TIPO_USUARIOS.NOMBRE AS nombre_clasifica_documento,
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
                            PERMISO_DOCUMENTO_USUARIOS.ESTADO")
                           .where("permiso_documento_usuarios.user_id = ?",@usuario_permiso_documento_id)
  end

end
