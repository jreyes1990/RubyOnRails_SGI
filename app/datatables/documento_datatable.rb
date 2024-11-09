class DocumentoDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  #Definición de los Helpers de la vista
  def_delegator :@view, :current_user
  def_delegator :@view, :link_to
  def_delegator :@view, :image_tag
  def_delegator :@view, :tiene_permiso
  #def_delegator :@view, :seguimiento_solicitudes_path
  #def_delegator :@view, :nueva_solicitud_cambio_path
  #def_delegator :@view, :solicitud_cambios_path
  def_delegator :@view, :modal_preview_file_path
  def_delegator :@view, :edit_documento_path
  def_delegator :@view, :inactivar_documento_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    @proceso_id = opts[:proceso_id]
    super
  end

  def view_columns
    @view_columns ||= {
      abr_clasifica: { source: "", searchable: false, orderable: false },
      abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like, formatter: -> (o) { o.upcase } },
      abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like, formatter: -> (o) { o.upcase } },
      codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like, formatter: -> (o) { o.upcase } },
      nombre_documento: { source: "DocumentoView.nombre", cond: :like, formatter: -> (o) { o.upcase } },
      abr_tipo_docto: { source: "DocumentoView.abr_tipo_docto", cond: :like, formatter: -> (o) { o.upcase } },
      version_actual: { source: "DocumentoView.version", cond: :like },
      fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like }
    }

    # Hash de permisos y configuración de columnas opcionales
    columnas_opcionales = {
      "BOTON VER PDF" => -> { { docto_pdf: { source: "", searchable: false, orderable: false } } },
      "BOTON VER WORD" => -> { { docto_word: { source: "", searchable: false, orderable: false } } },
      "BOTON VER EXCEL" => -> { { docto_excel: { source: "", searchable: false, orderable: false } } },
      "BOTON EDITAR REGISTRO" => -> { { editar: { source: "", searchable: false, orderable: false } } },
      "BOTON ELIMINAR REGISTRO" => -> { { inactivar: { source: "", searchable: false, orderable: false } } }
    }

    # Itera sobre los permisos y agrega columnas a `@view_columns` solo si el permiso está activo
    columnas_opcionales.each do |permiso, proc|
      @view_columns.merge!(proc.call) if tiene_permiso(permiso, "VER")
    end
    @view_columns
  end

  def data
    result =  records.map do |record|
      base_data = {
        abr_clasifica: show_clasifica(record),
        abr_sistema: nombre_sistema_admin(record),
        abr_proceso: nombre_proceso_admin(record),
        codigo_documento: record.try(:codigo_documento),
        nombre_documento: record.try(:nombre),
        abr_tipo_docto: nombre_tipo_docto(record),
        version_actual: record.try(:version),
        fecha_documento: record.try(:fecha_vigencia)
      }

      # Hash con los permisos y botones correspondientes
      opciones = {
        "BOTON VER PDF" => -> { { docto_pdf: show_btn_pdf(record) } },
        "BOTON VER WORD" => -> { { docto_word: show_btn_word(record) } },
        "BOTON VER EXCEL" => -> { { docto_excel: show_btn_excel(record) } },
        "BOTON EDITAR REGISTRO" => -> { { editar: show_btn_editar(record) } },
        "BOTON ELIMINAR REGISTRO" => -> { { inactivar: show_btn_eliminar(record) } }
      }

      # Itera sobre las opciones y agrega a `base_data` solo si tiene permiso
      opciones.each do |permiso, proc|
        base_data.merge!(proc.call) if tiene_permiso(permiso, "VER")
      end
      base_data
    end
    result
  end

  def get_raw_records
    DocumentoView.permiso_para_usuario(current_user.id).distinct
  end

  def nombre_sistema_admin(record)
    valor = nil
    @permiso_rol = PersonasArea.select("roles.nombre as nombre_rol").joins(:persona, :area, :rol).where(personas: {user_id: current_user.id}).first

    if @permiso_rol.nombre_rol.present?
      if ["SUPER ADMINISTRADOR", "ADMINISTRADOR", "ASISTENTE ADMINISTRADOR"].include?(@permiso_rol.nombre_rol)
        valor = "<a data-custom-class='popover-success' title='#{record.nombre_sistema}' data-content='#{record.nombre_sistema}'>#{record.abr_sistema.upcase}</a>".html_safe
      else
        valor = record.try(:nombre_sistema)
      end
    end

    return valor
  end

  def nombre_proceso_admin(record)
    @permiso_rol = PersonasArea.select("roles.nombre as nombre_rol").joins(:persona, :area, :rol).where(personas: {user_id: current_user.id}).first

    valor = nil
    if @permiso_rol.nombre_rol.present?
      if ["SUPER ADMINISTRADOR", "ADMINISTRADOR", "ASISTENTE ADMINISTRADOR"].include?(@permiso_rol.nombre_rol)
        valor = "<a data-custom-class='popover-success' title='#{record.nombre_proceso}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_proceso}'>#{record.abr_proceso.upcase}</a>".html_safe
      else
        valor = record.try(:nombre_proceso)
      end
    end

    return valor
  end

  def nombre_sistema(record)
    @permiso_rol = PersonasArea.select("roles.nombre as nombre_rol").joins(:persona, :area, :rol).where(personas: {user_id: current_user.id}).first

    valor = nil
    if @permiso_rol.nombre_rol.present?
      if ["SUPER ADMINISTRADOR", "ADMINISTRADOR", "ASISTENTE ADMINISTRADOR"].include?(@permiso_rol.nombre_rol)
        valor = "<a data-custom-class='popover-success' title='#{record.nombre_sistema}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_sistema}'>#{record.nombre_sistema.upcase}</a>".html_safe
      else
        valor = record.try(:nombre_sistema)
      end
    end

    return valor
  end

  def nombre_proceso(record)
    @permiso_rol = PersonasArea.select("roles.nombre as nombre_rol").joins(:persona, :area, :rol).where(personas: {user_id: current_user.id}).first

    valor = nil
    if @permiso_rol.nombre_rol.present?
      if ["SUPER ADMINISTRADOR", "ADMINISTRADOR", "ASISTENTE ADMINISTRADOR"].include?(@permiso_rol.nombre_rol)
        valor = "<a data-custom-class='popover-success' title='#{record.nombre_proceso}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_proceso}' style='color: #b3731c;'>#{record.nombre_sistema.upcase}</a><a style='color: #556093'> - #{record.nombre_proceso.upcase}</a>".html_safe
      else
        valor = record.try(:nombre_proceso)
      end
    end

    return valor
  end

  def nombre_tipo_docto(record)
    @permiso_rol = PersonasArea.select("roles.nombre as nombre_rol").joins(:persona, :area, :rol).where(personas: {user_id: current_user.id}).first

    valor = nil
    if @permiso_rol.nombre_rol.present?
      if ["SUPER ADMINISTRADOR", "ADMINISTRADOR", "ASISTENTE ADMINISTRADOR"].include?(@permiso_rol.nombre_rol)
        valor = "<a data-custom-class='popover-success' title='#{record.nombre_tipo_docto}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_tipo_docto}'>#{record.abr_tipo_docto}</a>".html_safe
      else
        valor = record.try(:nombre_tipo_docto)
      end
    end

    return valor
  end

  def show_btn_pdf(record)
    btnPdf = nil
    valor_documento = Documento.where(id: record.id).first

    if tiene_permiso("BOTON VER PDF", "VER")
      if valor_documento.file_pdf.present?
        btnPdf = link_to(image_tag("pdf.png", height: '33', width: '30'), modal_preview_file_path(:id => record.id, tipo_file: 'pdf', opcion: 1), :remote => true, data: { 'toggle' => "modal", 'target' => '#modal-content-preview-file' })
      else
        btnPdf = ""
      end
    else
      btnPdf = ""
    end

    return btnPdf
  end

  def show_btn_word(record)
    btnWord = nil
    valor_documento = Documento.where(id: record.id).first

    if tiene_permiso("BOTON VER WORD", "VER")
      if valor_documento.file_word_preview.present?
        btnWord = link_to(image_tag("word.png", height: '33', width: '30'), modal_preview_file_path(:id => record.id, tipo_file: 'word', opcion: 1), :remote => true, data: { 'toggle' => "modal", 'target' => '#modal-content-preview-file' })
      else
        btnWord = ""
      end
    else
      btnWord = ""
    end

    return btnWord
  end

  def show_btn_excel(record)
    btnExcel = nil
    valor_documento = Documento.where(id: record.id).first

    if tiene_permiso("BOTON VER EXCEL", "VER")
      if valor_documento.file_excel_preview.present?
        btnExcel = link_to(image_tag("excel.png", height: '33', width: '30'), modal_preview_file_path(:id => record.id, tipo_file: 'excel', opcion: 1), :remote => true, data: { 'toggle' => "modal", 'target' => '#modal-content-preview-file' })
      else
        btnExcel = ""
      end
    else
      btnExcel = ""
    end

    return btnExcel
  end

  def show_btn_editar(record)
    puts("verificando el boton actualizar")
    puts("valor: #{tiene_permiso("BOTON EDITAR REGISTRO", "VER")}")
    btnEditar = nil
    if tiene_permiso("BOTON EDITAR REGISTRO", "VER")
        btnEditar =  link_to("<i class='fas fa-edit'></i>".html_safe, edit_documento_path(record), class: "btn btn-outline-info btn-sm ")
    end

    return btnEditar
  end

  def show_btn_eliminar(record)
    btnInactivar = nil
    if tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
        btnInactivar = link_to("<i class='fas fa-trash-alt'></i>".html_safe, inactivar_documento_path(:id => record.id), class: "btn btn-outline-danger btn-sm", data: { controller: 'sweetalert', action: 'click->sweetalert#btnInactivar',
                                                                                                                                                                          sweetalert_confirm_alert_value: "Inactivar",
                                                                                                                                                                          sweetalert_cancel_alert_value: "Cancelado",
                                                                                                                                                                          sweetalert_confirm_title_value: 'Esta seguro de inactivar <p><strong style="color: #1d71b9;">' + "#{record.nombre}?" + '</strong></p>',
                                                                                                                                                                          sweetalert_confirm_btn_value: '<i class="fas fa-check-circle"></i><strong> Si, Inactivar</strong>',
                                                                                                                                                                          sweetalert_cancel_btn_value: '<i class="fas fa-times-circle"></i><strong> No, Cancelar</strong>',
                                                                                                                                                                          sweetalert_cancel_title_value: "Se ha cancelado la inactivación de #{record.nombre}" })
    end
    return btnInactivar
  end

  def show_clasifica(record)
    @permiso_documento = PermisoDocumento.select("tipo_usuarios.nombre")
                                         .joins("left join tipo_usuarios on(permiso_documentos.tipo_usuario_id=tipo_usuarios.id)
                                                 left join permiso_documento_usuarios on(permiso_documentos.id=permiso_documento_usuarios.permiso_documento_id)").where("permiso_documentos.documento_id=? and permiso_documento_usuarios.user_id=?", record.id, current_user.id).first

    if @permiso_documento.present?
      resultado = @permiso_documento.nombre
    else
      resultado = record.id
    end
    return resultado
  end
end
