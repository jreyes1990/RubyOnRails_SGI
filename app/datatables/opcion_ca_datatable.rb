class OpcionCaDatatable < AjaxDatatablesRails::ActiveRecord 
  extend Forwardable

  #Definición de los Helpers de la vista
  def_delegator :@view, :link_to
  def_delegator :@view, :tiene_permiso
  def_delegator :@view, :edit_opcion_ca_path
  def_delegator :@view, :inactivar_opcion_ca_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "OpcionCa.id", cond: :eq },
      opcion: { source: "Opcion.nombre", cond: :like },
      componente: { source: "Componente.nombre", cond: :like },
      atributo: { source: "Atributo.nombre", cond: :like },
      descripcion: { source: "OpcionCa.descripcion", cond: :like },
      estado: { source: "OpcionCa.estado", cond: :like },
      editar: { source: "", searchable: false, orderable: false},
      inactivar: { source: "", searchable: false, orderable: false}
    }
  end

  def data    
    records.map do |record|    
        {        
            id: record.id,
            opcion: record.opcion.try(:nombre),
            componente: record.componente.try(:nombre),
            atributo: record.atributo.try(:nombre),
            descripcion: record.descripcion,
            estado: record.estado,
            editar: show_btn_editar(record),
            inactivar: show_btn_eliminar(record)
        }
      
    end
  end

  def get_raw_records
    OpcionCa.joins(:opcion, :componente, :atributo).where(:estado => 'A').order(:id)
  end

  def show_btn_editar(value)
    btnEditar = nil
    if tiene_permiso("BOTON EDITAR REGISTRO", "VER")
        btnEditar =  link_to("<i class='fas fa-edit'></i>".html_safe, edit_opcion_ca_path(value), class: "btn btn-outline-info btn-sm ") 
    else
      btnEditar = ""
    end
    return btnEditar
  end

  def show_btn_eliminar(value)
    btnInactivar = nil
    if tiene_permiso("BOTON ELIMINAR REGISTRO", "VER")
        btnInactivar = link_to("<i class='fas fa-trash-alt'></i>".html_safe, inactivar_opcion_ca_path(:id => value.id), class: "btn btn-outline-danger btn-sm", data: { confirm: '¿Seguro que desea eliminar el registro, esta acción no puede desahacerse?' }) 
    else
      btnInactivar = ""
    end
    return btnInactivar
  end

end
