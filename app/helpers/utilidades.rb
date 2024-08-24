module Utilidades
  require 'libreconv'

  public
  def current_area_id_parametro
    parametros_area = Parametro.where(:user_id => current_user.id).first
    if (parametros_area != nil) then
      area_id = parametros_area.area_id
      return area_id
    else
      return area_id = ''
    end 
  end

  def genera_bitacora(bitacora, codigo, correlativo, nombre, fecha, version, descrip, estado, user_created_id, user_updated_id,
                      empresa_id, proceso_id, tipo_sistema_id, documento_id, tipo_documento_id, estado_documento_id, etapa_solic, solic_cambio_id, seguim_solic, fecha_seg )

    if bitacora == "DOCUMENTO_AUTORIZADO"
      bita = BitacoraDocumento.new
      bita.codigo = codigo
      bita.correlativo = correlativo
      bita.nombre = nombre
      bita.fecha_vigencia = fecha
      bita.version = version
      bita.descripcion = descrip
      bita.estado = estado
      bita.user_created_id = user_created_id
      bita.user_updated_id = user_updated_id
      bita.empresa_id = empresa_id
      bita.proceso_id = proceso_id
      bita.tipo_sistema_id = tipo_sistema_id
      bita.tipo_documento_id = tipo_documento_id
      bita.estado_documento_id = estado_documento_id
      bita.documento_id = documento_id
      bita.save
    elsif bitacora == "SOLICITUD_CAMBIO"
      bita = BitacoraSolicitudCambio.new
      bita.fecha_solicitud = fecha
      bita.descripcion = descrip
      bita.documento_id = documento_id
      bita.estado_documento_id = estado_documento_id
      bita.etapa_solicitud_id = etapa_solic
      bita.user_created_id = user_created_id
      bita.user_updated_id = user_updated_id
      bita.estado = estado
      bita.solicitud_cambio_id = solic_cambio_id
      bita.save
    elsif bitacora == "SEGUIMIENTO_SOLICITUD"
      bita = BitacoraSeguimiento.new
      bita.fecha_seguimiento = fecha_seg
      bita.version = version
      bita.fecha_vigencia = fecha
      bita.descripcion = descrip
      bita.estado_documento_id = estado_documento_id
      bita.etapa_seguimiento_id = etapa_solic
      bita.user_created_id = user_created_id
      bita.user_updated_id = user_updated_id
      bita.estado = estado
      bita.solicitud_cambio_id = solic_cambio_id
      bita.seguimiento_solicitud_id = seguim_solic
      bita.save
    end
  end

  def genera_bitacora_acceso(tabla, evento, tipo_usuario_id, tipo_sistema_id, proceso_id, tipo_documento_id, documento_id, permiso_documento_id, usuario_id, permiso_documento_usuario_id,
                             todo, user_created_id, user_updated_id, estado)
    if tabla == "PERMISO_DOCUMENTOS"
      bita = BitacoraAcceso.new
      bita.tabla = tabla
      bita.evento = evento
      bita.tipo_usuario_id = tipo_usuario_id
      bita.tipo_sistema_id = tipo_sistema_id
      bita.proceso_id = proceso_id
      bita.documento_id = documento_id
      bita.tipo_documento_id = tipo_documento_id
      bita.permiso_documento_id = permiso_documento_id
      bita.todo = todo
      bita.user_created_id = user_created_id
      bita.user_updated_id = user_updated_id
      bita.estado = estado
      bita.save
    elsif tabla == "PERMISO_DOCUMENTO_USUARIOS"
      bita = BitacoraAcceso.new
      bita.tabla = tabla
      bita.evento = evento
      bita.usuario_id = usuario_id
      bita.permiso_documento_id = permiso_documento_id
      bita.permiso_documento_usuario_id = permiso_documento_usuario_id
      bita.user_created_id = user_created_id
      bita.user_updated_id = user_updated_id
      bita.estado = estado
      bita.save
    end
  end

  def genera_bitacora_movil(bitacora, persona_id, email, accion, descripcion)
    t = Time.now
    fechaHora = t.strftime("%d/%m/%Y")
    hora = t.strftime("%H:%M:%S")

      if bitacora == "GESTION_TOKEN"
        bita = BitacoraTokenPersona.new        
      elsif bitacora == "AUTENTICACION_MOVIL"
        bita = BitacoraAutenticacionMovil.new
        bita.email = email        
      elsif bitacora = "CONSULTA_MOVIL"
        bita = BitacoraConsultaMovil.new        
      end  

      bita.persona_id = persona_id
      bita.accion = accion
      bita.descripcion = descripcion
      bita.fecha = fechaHora
      bita.hora = hora
      bita.save
  end 

  def custom_query(sql)
    results = ActiveRecord::Base.connection.exec_query(sql)
  
    if results.present?
      return results
    else
      return nil
    end
  end
  
  def fecha_actual
    t = Time.now
    fecha = t.strftime("%d/%m/%Y")
    return fecha
  end 

  def fecha_actual_ot
    t = Time.now
    fecha = t.strftime("%Y-%m-%d")
    return fecha
  end

  def current_empresa_id_permisos(persona_id)
    @persona = Persona.find(persona_id)
    id_empresa = 0     
    @area = Area.joins("inner join personas_areas on personas_areas.area_id = areas.id
                            inner join personas on personas.id = personas_areas.persona_id
                            inner join empresas on empresas.id = areas.empresa_id
                            where personas.user_id = #{@persona.user_id}").first
    id_empresa = @area.empresa_id
    return id_empresa
  end

  #reporteria
  def fecha_hora_actual
    t = Time.now
    fecha = t.strftime("%d/%m/%Y %H:%M:%S")
    return fecha
  end 
  
  def ano_actual
    t = Time.now
    fecha = t.strftime("%Y")
    return fecha
  end 

  def current_user_name_reportes
    persona = Persona.where("user_id = ? ", current_user.id).first
    if (persona != nil) then
        if (persona.nombre != nil || persona.apellido != nil )
        return persona.nombre.upcase + " " + persona.apellido.upcase

        else
            return current_user.email

        end
    else
        return current_user.email
    end
  end

  def response_api_ordencompra(url, autorizacion, orden_compra, user ,codigo_empresa)
    
    response = RestClient.get url, {Authorization: autorizacion , params: {orden_compra: orden_compra, user: user, codigo_empresa: codigo_empresa}}
  
    if response.present?
      return response
    else
      return nil
    end
  end

  def crear_docto_to_preview(file_cargado, documento_master)

      #GENERACIÓN DE WORD A PDF PARA PREVIEW
        if file_cargado.content_type == 'application/msword' || file_cargado.content_type == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' || file_cargado.content_type == 'application/vnd.ms-excel' || file_cargado.content_type == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
          
          File.open("tmp/#{file_cargado.filename.to_s}", 'wb') do |file|
              file.write(file_cargado.download)
          end  

          Libreconv.convert("#{Rails.root}/tmp/#{file_cargado.filename.to_s}", "#{Rails.root}/tmp/#{file_cargado.filename.to_s}.pdf")      
          
          documento_master.attach(io: File.open("#{Rails.root}/tmp/#{file_cargado.filename.to_s}.pdf"), filename: "#{file_cargado.filename.to_s}.pdf", content_type: "application/pdf")

          #ELIMINACIÓN DE LOS ARCHIVOS TEMPORALES
          File.delete("#{Rails.root}/tmp/#{file_cargado.filename.to_s}")
          File.delete("#{Rails.root}/tmp/#{file_cargado.filename.to_s}.pdf")

        end
  end

  def var_preview_docs(file_original, file_preview)
    result = []
    docto_for_download = file_original.blob
    iconito = ''
    tituloModal = ''
    icono_descarga = ''
    titulo_btn_download = ''
    class_btn_download = ''
  
    if file_original.content_type == 'application/pdf'
      docto_for_preview = file_original.blob
      iconito = '<i style="color: red" class="fas fa-file-pdf fa-2x"></i>'
      tituloModal = 'PREVISUALIZAR DOCUMENTO PDF'
      icono_descarga = '<i class="fas fa-file-pdf"></i>'
      titulo_btn_download = 'Descargar archivo PDF'
      class_btn_download = 'btn btn-outline-danger btn-sm'
    elsif file_original.content_type == 'application/msword' || file_original.content_type == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
      docto_for_preview = file_preview.blob
      iconito = '<i style="color: #4e73df"  class="fas fa-file-word fa-2x"></i>'
      tituloModal = 'PREVISUALIZAR DOCUMENTO WORD'
      icono_descarga = '<i class="fas fa-file-word"></i>'
      titulo_btn_download = 'Descargar archivo WORD'
      class_btn_download = 'btn btn-outline-primary btn-sm'
    elsif file_original.content_type == 'application/vnd.ms-excel' || file_original.content_type == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      docto_for_preview = file_preview.blob
      iconito = '<i style="color: #1cc88a"  class="fas fa-file-excel fa-2x"></i>'
      tituloModal = 'PREVISUALIZAR DOCUMENTO EXCEL'
      icono_descarga = '<i class="fas fa-file-excel"></i>'
      titulo_btn_download = 'Descargar archivo EXCEL'
      class_btn_download = 'btn btn-outline-success btn-sm'
    end

    result.push(docto_for_download)
    result.push(docto_for_preview)
    result.push(iconito)
    result.push(tituloModal)
    result.push(icono_descarga)
    result.push(titulo_btn_download)
    result.push(class_btn_download)

    return result
  end

  def format_digitos(correlativo)
    if !correlativo.nil?
      respuesta = correlativo.to_s.rjust(3,"0")
    end

    return respuesta
  end
end 