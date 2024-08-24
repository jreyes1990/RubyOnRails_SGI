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
    if tiene_permiso("BOTON EDITAR REGISTRO", "VER") && tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
      @view_columns ||= {
        id: { source: "DocumentoView.id", cond: :eq },
        abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
        abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
        codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
        nombre_documento: { source: "DocumentoView.nombre", cond: :like },
        abr_tipo_docto: { source: "DocumentoView.abr_tipo_docto", cond: :like },
        version_actual: { source: "DocumentoView.version", cond: :like },
        fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
        docto_pdf: { source: "", searchable: false, orderable: false },
        docto_word: { source: "", searchable: false, orderable: false },
        docto_excel: { source: "", searchable: false, orderable: false },
        editar: { source: "", searchable: false, orderable: false},
        inactivar: { source: "", searchable: false, orderable: false}
      }
    else
      if tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
        @view_columns ||= {
          #id: { source: "DocumentoView.id", cond: :eq },
          abr_clasifica: { source: "", searchable: false, orderable: false },
          abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
          abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
          codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
          nombre_documento: { source: "DocumentoView.nombre", cond: :like },
          version_actual: { source: "DocumentoView.version", cond: :like },
          fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
          docto_pdf: { source: "", searchable: false, orderable: false },
          docto_word: { source: "", searchable: false, orderable: false },
          docto_excel: { source: "", searchable: false, orderable: false }
        }
      else
        if tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && !tiene_permiso("BOTON VER EXCEL", "VER")
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
            docto_pdf: { source: "", searchable: false, orderable: false },
            docto_word: { source: "", searchable: false, orderable: false }
          }
        elsif tiene_permiso("BOTON VER PDF", "VER") && !tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
            docto_pdf: { source: "", searchable: false, orderable: false },
            docto_excel: { source: "", searchable: false, orderable: false }
          }
        elsif tiene_permiso("BOTON VER PDF", "VER") && !tiene_permiso("BOTON VER WORD", "VER") && !tiene_permiso("BOTON VER EXCEL", "VER")
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
            docto_pdf: { source: "", searchable: false, orderable: false }
          }
        elsif !tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
            docto_word: { source: "", searchable: false, orderable: false },
            docto_excel: { source: "", searchable: false, orderable: false }
          }
        elsif !tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && !tiene_permiso("BOTON VER EXCEL", "VER")
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
            docto_word: { source: "", searchable: false, orderable: false }
          }
        elsif !tiene_permiso("BOTON VER PDF", "VER") && !tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like },
            docto_excel: { source: "", searchable: false, orderable: false }
          }
        else
          @view_columns ||= {
            #id: { source: "DocumentoView.id", cond: :eq },
            abr_clasifica: { source: "", searchable: false, orderable: false },
            abr_sistema: { source: "DocumentoView.abr_sistema", cond: :like },
            abr_proceso: { source: "DocumentoView.abr_proceso", cond: :like },
            codigo_documento: { source: "DocumentoView.codigo_documento", cond: :like },
            nombre_documento: { source: "DocumentoView.nombre", cond: :like },
            version_actual: { source: "DocumentoView.version", cond: :like },
            fecha_documento: { source: "DocumentoView.fecha_vigencia", cond: :like }
          }
        end
      end
    end
  end

  def data
    if tiene_permiso("BOTON EDITAR REGISTRO", "VER") && tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
      records.map do |record|
        {
          id: record.id,
          abr_sistema: nombre_sistema_admin(record),
          abr_proceso: nombre_proceso_admin(record),
          codigo_documento: record.try(:codigo_documento),
          nombre_documento: record.try(:nombre),
          abr_tipo_docto: nombre_tipo_docto(record),
          version_actual: record.try(:version),
          fecha_documento: record.try(:fecha_vigencia),
          docto_pdf: show_btn_pdf(record),
          docto_word: show_btn_word(record),
          docto_excel: show_btn_excel(record),
          editar: show_btn_editar(record),
          inactivar: show_btn_eliminar(record)
        }
      end
    else
      if tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
        records.map do |record|
          {
            #id: record.id,
            abr_clasifica: show_clasifica(record),
            abr_sistema: record.try(:nombre_sistema),
            abr_proceso: record.try(:nombre_proceso),
            codigo_documento: record.try(:codigo_documento),
            nombre_documento: record.try(:nombre),
            version_actual: record.try(:version),
            fecha_documento: record.try(:fecha_vigencia),
            docto_pdf: show_btn_pdf(record),
            docto_word: show_btn_word(record),
            docto_excel: show_btn_excel(record)
          }
        end
      else
        if tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && !tiene_permiso("BOTON VER EXCEL", "VER")
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia),
              docto_pdf: show_btn_pdf(record),
              docto_word: show_btn_word(record)
            }
          end
        elsif tiene_permiso("BOTON VER PDF", "VER") && !tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia),
              docto_pdf: show_btn_pdf(record),
              docto_excel: show_btn_excel(record)
            }
          end
        elsif tiene_permiso("BOTON VER PDF", "VER") && !tiene_permiso("BOTON VER WORD", "VER") && !tiene_permiso("BOTON VER EXCEL", "VER")
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia),
              docto_pdf: show_btn_pdf(record)
            }
          end
        elsif !tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia),
              docto_word: show_btn_word(record),
              docto_excel: show_btn_excel(record)
            }
          end
        elsif !tiene_permiso("BOTON VER PDF", "VER") && tiene_permiso("BOTON VER WORD", "VER") && !tiene_permiso("BOTON VER EXCEL", "VER")
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia),
              docto_word: show_btn_word(record)
            }
          end
        elsif !tiene_permiso("BOTON VER PDF", "VER") && !tiene_permiso("BOTON VER WORD", "VER") && tiene_permiso("BOTON VER EXCEL", "VER")
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia),
              docto_excel: show_btn_excel(record)
            }
          end
        else
          records.map do |record|
            {
              #id: record.id,
              abr_clasifica: show_clasifica(record),
              abr_sistema: record.try(:nombre_sistema),
              abr_proceso: record.try(:nombre_proceso),
              codigo_documento: record.try(:codigo_documento),
              nombre_documento: record.try(:nombre),
              version_actual: record.try(:version),
              fecha_documento: record.try(:fecha_vigencia)
            }
          end
        end
      end
      
    end
  end

  def get_raw_records
    @permiso_usuario = PermisoDocumentoUsuario.select("permiso_documentos.proceso_id, permiso_documentos.tipo_sistema_id, permiso_documentos.tipo_documento_id, permiso_documentos.documento_id")
                                              .joins("inner join permiso_documentos on(permiso_documento_usuarios.permiso_documento_id=permiso_documentos.id)
                                                      where permiso_documento_usuarios.estado='A'
                                                      and permiso_documentos.estado='A'
                                                      and permiso_documento_usuarios.user_id=#{current_user.id}")

   
      consulta_documentos = DocumentoView.joins("left join permiso_documentos
                                             on(documentos_views.proceso_id=permiso_documentos.proceso_id
                                             and documentos_views.tipo_sistema_id=permiso_documentos.tipo_sistema_id
                                             and documentos_views.tipo_documento_id=permiso_documentos.tipo_documento_id
                                             and documentos_views.id=permiso_documentos.documento_id)").distinct
   
    
    array_id = Array.new

    if !@permiso_usuario.blank?
      puts "***************** TIENE PERMISOS"

      @permiso_usuario.each do |d|
        @perm_proceso = d.proceso_id
        @perm_sistema = d.tipo_sistema_id
        @perm_tipo_documento = d.tipo_documento_id
        @perm_documento = d.documento_id

        permiso_proceso = @perm_proceso
        permiso_sistema = @perm_sistema
        permiso_tipo_documento = @perm_tipo_documento
        permiso_documento = @perm_documento

        if @perm_sistema != 0 && @perm_proceso != 0 && @perm_tipo_documento != 0 && @perm_documento != 0
          if @proceso_id.blank?
            @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)
                                                  AND documentos_views.proceso_id IN(?)
                                                  AND documentos_views.tipo_documento_id IN(?)
                                                  AND documentos_views.id IN(?)",'A',permiso_sistema,permiso_proceso,permiso_tipo_documento,permiso_documento).to_a
          else
            @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)
                                                  AND documentos_views.proceso_id IN(?)
                                                  AND documentos_views.tipo_documento_id IN(?)
                                                  AND documentos_views.id IN(?)
                                                  AND documentos_views.proceso_id IN(?)",'A',permiso_sistema,permiso_proceso,permiso_tipo_documento,permiso_documento,@proceso_id).to_a
          end
          
        elsif @perm_sistema != 0 && @perm_proceso != 0 && @perm_tipo_documento != 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                    AND documentos_views.tipo_sistema_id IN(?)
                                                    AND documentos_views.proceso_id IN(?)
                                                    AND documentos_views.tipo_documento_id IN(?)",'A',permiso_sistema,permiso_proceso,permiso_tipo_documento).to_a
        elsif @perm_sistema != 0 && @perm_proceso != 0 && @perm_tipo_documento == 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                    AND documentos_views.tipo_sistema_id IN(?)
                                                    AND documentos_views.proceso_id IN(?)",'A',permiso_sistema,permiso_proceso).to_a
        elsif @perm_sistema != 0 && @perm_proceso == 0 && @perm_tipo_documento == 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)",'A',permiso_sistema).to_a
        elsif @perm_sistema != 0 && @perm_proceso == 0 && @perm_tipo_documento == 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)
                                                  AND documentos_views.id IN(?)",'A',permiso_sistema,permiso_documento).to_a
        elsif @perm_sistema != 0 && @perm_proceso == 0 && @perm_tipo_documento != 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)
                                                  AND documentos_views.tipo_documento_id IN(?)
                                                  AND documentos_views.id IN(?)",'A',permiso_sistema,permiso_tipo_documento,permiso_documento).to_a
        elsif @perm_sistema != 0 && @perm_proceso != 0 && @perm_tipo_documento == 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)
                                                  AND documentos_views.proceso_id IN(?)
                                                  AND documentos_views.id IN(?)",'A',permiso_sistema,permiso_proceso,permiso_documento).to_a
        elsif @perm_sistema != 0 && @perm_proceso == 0 && @perm_tipo_documento != 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.tipo_sistema_id IN(?)
                                                  AND documentos_views.tipo_documento_id IN(?)",'A',permiso_sistema,permiso_tipo_documento).to_a


        elsif @perm_sistema == 0 && @perm_proceso != 0 && @perm_tipo_documento == 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.proceso_id IN(?)
                                                  AND documentos_views.id IN(?)",'A',permiso_proceso,permiso_documento).to_a
        elsif @perm_sistema == 0 && @perm_proceso == 0 && @perm_tipo_documento != 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                    AND documentos_views.tipo_documento_id IN(?)",'A',permiso_tipo_documento).to_a
        elsif @perm_sistema == 0 && @perm_proceso == 0 && @perm_tipo_documento != 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                    AND documentos_views.tipo_documento_id IN(?)
                                                    AND documentos_views.id IN(?)",'A',permiso_tipo_documento,permiso_documento).to_a
        elsif @perm_sistema == 0 && @perm_proceso != 0 && @perm_tipo_documento == 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                    AND documentos_views.proceso_id IN(?)",'A',permiso_proceso).to_a
        elsif @perm_sistema == 0 && @perm_proceso != 0 && @perm_tipo_documento != 0 && @perm_documento == 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.proceso_id IN(?)
                                                  AND documentos_views.tipo_documento_id IN(?)",'A',permiso_proceso,permiso_tipo_documento).to_a
        elsif @perm_sistema == 0 && @perm_proceso != 0 && @perm_tipo_documento != 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                    AND documentos_views.proceso_id IN(?)
                                                    AND documentos_views.tipo_documento_id IN(?)
                                                    AND documentos_views.id IN(?)",'A',permiso_proceso,permiso_tipo_documento,permiso_documento).to_a
        elsif @perm_sistema == 0 && @perm_proceso == 0 && @perm_tipo_documento == 0 && @perm_documento != 0
          @documentos_all = consulta_documentos.where("documentos_views.estado=?
                                                  AND documentos_views.id IN(?)",'A',permiso_documento).to_a
        else
          if current_user.id == 1 || current_user.id == 2
            @documentos_all = consulta_documentos.where("documentos_views.estado=? or documentos_views.estado is null",'A').to_a
          else
            @documentos_all = consulta_documentos.where("documentos_views.estado=?",'A').to_a
          end
        end

        @documentos_all.each do |f|
          @all_documentos_ids = array_id.push(f.id)
        end
      end

      if current_user.id > 3
        DocumentoView.joins("inner join permiso_documentos on(documentos_views.id=permiso_documentos.documento_id)
                             inner join permiso_documento_usuarios on(permiso_documentos.id=permiso_documento_usuarios.permiso_documento_id)")
                     .where("documentos_views.id in(?) and permiso_documento_usuarios.user_id=?",@all_documentos_ids,current_user.id)
                     .order("permiso_documentos.tipo_usuario_id, documentos_views.nombre_sistema desc, documentos_views.nombre_proceso, (CASE WHEN documentos_views.ABR_TIPO_DOCTO='R' THEN 0 WHEN documentos_views.ABR_TIPO_DOCTO='G' THEN 1 WHEN documentos_views.ABR_TIPO_DOCTO='P' THEN 2 WHEN documentos_views.ABR_TIPO_DOCTO='M' THEN 3 WHEN documentos_views.ABR_TIPO_DOCTO='I' THEN 4 ELSE 5 END), documentos_views.codigo_documento")
      else
        DocumentoView.where(id: @all_documentos_ids).order("documentos_views.nombre_sistema, documentos_views.nombre_proceso, (CASE WHEN documentos_views.ABR_TIPO_DOCTO='M' THEN 0 WHEN documentos_views.ABR_TIPO_DOCTO='P' THEN 1 WHEN documentos_views.ABR_TIPO_DOCTO='I' THEN 2 WHEN documentos_views.ABR_TIPO_DOCTO='G' THEN 3 WHEN documentos_views.ABR_TIPO_DOCTO='R' THEN 4 ELSE 5 END), documentos_views.codigo_documento")
      end

    else
      puts "***************** NO TIENE PERMISOS"
      respond_to do |format|
        format.html { redirect_to root_url, alert: "No tiene permiso suficiente, Favor comunicarse con el Área de Sistema de Gestión" }
        format.json { render :show, status: :created, location: @permiso_usuario }
      end
    end
  end 

  def nombre_sistema_admin(record)
    return "<a data-custom-class='popover-success' title='#{record.nombre_sistema}' data-content='#{record.nombre_sistema}'>#{record.abr_sistema.upcase}</a>".html_safe
  end

  def nombre_proceso_admin(record)
    return "<a data-custom-class='popover-success' title='#{record.nombre_proceso}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_proceso}'>#{record.abr_proceso.upcase}</a>".html_safe
  end

  def nombre_sistema(record)
    return "<a data-custom-class='popover-success' title='#{record.nombre_sistema}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_sistema}'>#{record.nombre_sistema.upcase}</a>".html_safe
  end

  def nombre_proceso(record)
    return "<a data-custom-class='popover-success' title='#{record.nombre_proceso}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_proceso}' style='color: #b3731c;'>#{record.nombre_sistema.upcase}</a><a style='color: #556093'> - #{record.nombre_proceso.upcase}</a>".html_safe
  end

  def nombre_tipo_docto(record)
    return "<a data-custom-class='popover-success' title='#{record.nombre_tipo_docto}' data-toggle='popover' data-trigger='hover' data-content='#{record.nombre_tipo_docto}'>#{record.abr_tipo_docto}</a>".html_safe
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
      btnExcel = "<td style='background: white;'><td>".html_safe
    end

    return btnExcel
  end

  def show_btn_editar(record)
    btnEditar = nil
    if tiene_permiso("BOTON EDITAR REGISTRO", "VER")
        btnEditar =  link_to("<i class='fas fa-edit'></i>".html_safe, edit_documento_path(record), class: "btn btn-outline-info btn-sm ") 
    else
      btnEditar = ""
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
    else
      btnInactivar = "".html_safe
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
      resultado = ''
    end
    return resultado
  end
end
