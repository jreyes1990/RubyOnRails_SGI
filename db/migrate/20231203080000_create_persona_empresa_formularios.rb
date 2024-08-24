class CreatePersonaEmpresaFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :persona_empresa_formularios, id: false, comment: "Módulo Configuración de (Persona-Área)-(Opcion-Componente-Atributo)" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :personas_area, null: false, foreign_key: false, index: false, comment: "Identificador de la persona por área"
      t.references :opcion_ca, null: false, foreign_key: false, index: false, comment: "Identificador de opcion_cas"
      t.string :descripcion, null: true, comment: "Descripción general de la persona empresa formulario"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence persona_empresa_formulario_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table persona_empresa_formularios add
        constraint pk_pEmpForm
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :persona_empresa_formularios, :personas_areas, column: :personas_area_id, name: 'fk_pEmpForm_personArea'
    add_foreign_key :persona_empresa_formularios, :opcion_cas, column: :opcion_ca_id, name: 'fk_pEmpForm_opcionCa'

    # Agregar el índice único con el nombre personalizado
    add_index :persona_empresa_formularios, [:personas_area_id, :opcion_ca_id], name: "uidx_pEmpForm", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table persona_empresa_formularios add
        constraint ck_estado_pEmpForm
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_pers_emp_formularios_seq
      before insert on persona_empresa_formularios
      for each row
        when (new.id is null)
      begin
        :new.id := persona_empresa_formulario_seq.nextval;
      end;
    SQL
  end
end
