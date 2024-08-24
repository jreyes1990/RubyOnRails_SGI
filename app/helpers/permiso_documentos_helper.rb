module PermisoDocumentosHelper
  def encabezado_columna(icono, record)
    return "<td ><i class='#{icono}'></i> | #{record}</td>".html_safe
  end

  def encabezado_documento(icono, record)
    
    return "<td>#{check_box_tag "permiso_documentos_ids[]", record.id, false, checkbox_attributes(record)}
            #{estado_icon(record)}
            #{documento_info(record)}
            </td>".html_safe
  end

  # Helper para obtener información del sistema
  def sistema_info(permiso_documento)
    "<i class='fas fa-folder-plus'></i> | #{permiso_documento.tipo_sistema.try(:nombre).upcase}".html_safe
  end

  # Helper para obtener información del proceso
  def proceso_info(permiso_documento)
    "<i class='fas fa-folder'></i> | #{permiso_documento.proceso.try(:nombre).upcase}".html_safe
  end

  # Helper para obtener información del tipo de documento
  def tipo_documento_info(permiso_documento)
    "<i class='fas fa-folder-open'></i> | #{permiso_documento.tipo_documento.try(:nombre).upcase}".html_safe
  end

  def documento(permiso_documento)
    return check_box_tag "permiso_documentos_ids[]", permiso_documento.id, false, checkbox_attributes(permiso_documento)
  end

  # Helper para obtener atributos del checkbox
  def checkbox_attributes(permiso_documento)
    if tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
      { class: "permiso-documento-checkbox", id: permiso_documento.id, data: { tipo_usuario_id: permiso_documento.tipo_usuario_id, estado: permiso_documento.estado }, style: "margin-right: 10px;" }
    else
      { disabled: true }
    end
  end

  # Helper para obtener el ícono de estado
  def estado_icon(permiso_documento)
    if tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
      if permiso_documento.estado == 'A'
        "<i class='fas fa-toggle-on' style='color: green'></i>".html_safe
      else
        "<i class='fas fa-toggle-on' style='transform: rotate(180deg);color: red'></i>".html_safe
      end
    end
  end

  # Helper para obtener información del documento
  def documento_info(permiso_documento)
    "<label for='#{permiso_documento.id}'><i class='far fa-file-pdf'></i> | #{documento_nombre(permiso_documento)}</label>".html_safe
  end

  # Helper para obtener el nombre del documento
  def documento_nombre(permiso_documento)
    "#{permiso_documento.documento.try(:codigo)}#{format_digitos(permiso_documento.documento.try(:correlativo))}  #{permiso_documento.documento.try(:nombre).upcase}"
  end

  # Helper para renderizar los permiso_documentos
  def render_permiso_documentos(permiso_documentos, op)
    permiso_documentos.select { |permiso_documento| op.tipo_usuario_id == permiso_documento.tipo_usuario_id }
                      .map { |permiso_documento| render partial: 'permiso_documento', locals: { permiso_documento: permiso_documento } }
                      .join("\n")
                      .html_safe
  end
end
