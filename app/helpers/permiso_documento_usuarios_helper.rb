module PermisoDocumentoUsuariosHelper
  def usuario_encabezado_columna(icono, record)
    return "<td><i class='#{icono}'></i> | #{record}</td>".html_safe
  end

  def usuario_encabezado_documento(icono, record)
    
    return "<td>#{check_box_tag "documentos_ids[]", record.id, false, usuario_checkbox_attributes(record)}
            #{usuario_estado_icon(record)}
            #{usuario_documento_info(record)}
            </td>".html_safe
  end

  # Helper para obtener información del sistema
  def clasifica_documento_info(permiso_documento_usuario)
    "<i class='fas fa-user'></i> | #{permiso_documento_usuario.permiso_documento.tipo_usuario.try(:nombre).upcase}".html_safe
  end

  # Helper para obtener información del sistema
  def usuario_sistema_info(permiso_documento_usuario)
    "<i class='fas fa-folder-plus'></i> | #{permiso_documento_usuario.permiso_documento.tipo_sistema.try(:nombre).upcase}".html_safe
  end

  # Helper para obtener información del proceso
  def proceso_proceso_info(permiso_documento_usuario)
    "<i class='fas fa-folder'></i> | #{permiso_documento_usuario.permiso_documento.proceso.try(:nombre).upcase}".html_safe
  end

  # Helper para obtener información del tipo de documento
  def usuario_tipo_documento_info(permiso_documento_usuario)
    "<i class='fas fa-folder-open'></i> | #{permiso_documento_usuario.permiso_documento.tipo_documento.try(:nombre).upcase}".html_safe
  end

  def usuario_documento(permiso_documento_usuario)
    return check_box_tag "documentos_ids[]", permiso_documento_usuario.id, false, usuario_checkbox_attributes(permiso_documento_usuario)
  end

  # Helper para obtener atributos del checkbox
  def usuario_checkbox_attributes(permiso_documento_usuario)
    if tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
      { class: "documento-checkbox", id: permiso_documento_usuario.id, data: { user_id: permiso_documento_usuario.user_id, estado: permiso_documento_usuario.estado }, style: "margin-right: 10px;" }
    else
      { disabled: true }
    end
  end

  # Helper para obtener el ícono de estado
  def usuario_estado_icon(permiso_documento_usuario)
    if tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
      if permiso_documento_usuario.estado == 'A'
        "<i class='fas fa-toggle-on' style='color: green'></i>".html_safe
      else
        "<i class='fas fa-toggle-on' style='transform: rotate(180deg);color: red'></i>".html_safe
      end
    end
  end

  # Helper para obtener información del documento
  def usuario_documento_info(permiso_documento_usuario)
    "<label for='#{permiso_documento_usuario.id}'><i class='far fa-file-pdf'></i> | #{usuario_documento_nombre(permiso_documento_usuario)}</label>".html_safe
  end

  # Helper para obtener el nombre del documento
  def usuario_documento_nombre(permiso_documento_usuario)
    "#{permiso_documento_usuario.permiso_documento.documento.try(:codigo)}#{format_digitos(permiso_documento_usuario.permiso_documento.documento.try(:correlativo))}  #{permiso_documento_usuario.permiso_documento.documento.try(:nombre).upcase}"
  end

  # Helper para renderizar los permiso_documentos
  def render_permiso_documento_usuarios(permiso_documento_usuarios, op)
    permiso_documento_usuarios.select { |permiso_documento_usuario| op.user_id == permiso_documento_usuario.user_id }
                      .map { |permiso_documento_usuario| render partial: 'permiso_documento_usuario', locals: { permiso_documento_usuario: permiso_documento_usuario } }
                      .join("\n")
                      .html_safe
  end
end
