class CreateProcesos < ActiveRecord::Migration[6.0]
  def change
    create_table :procesos, id: false, comment: "Modulo Configuración Procesos" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.references :macro_proceso, null: false, foreign_key: false, index: false, comment: "Identificador del macro proceso"
      t.references :tipo_proceso, null: false, foreign_key: false, index: false, comment: "Identificador del tipo de proceso"
      t.string :nombre, limit: 150, null: false, comment: "Nombre del proceso"
      t.string :descripcion, comment: "Descripción general del proceso"
      t.string :abreviatura, limit: 5, null: false, comment: "Identificador de la abreviatura del proceso"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence procesos_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table procesos add
        constraint pk_proceso
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :procesos, :empresas, column: :empresa_id, name: 'fk_proceso_empresa'
    add_foreign_key :procesos, :macro_procesos, column: :macro_proceso_id, name: 'fk_proceso_macroProceso'
    add_foreign_key :procesos, :tipo_procesos, column: :tipo_proceso_id, name: 'fk_proceso_tipoProceso'

    # Agregar el índice único con el nombre personalizado
    add_index :procesos, [:empresa_id, :macro_proceso_id, :tipo_proceso_id, :nombre], name: "uidx_proceso", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table procesos add
        constraint ck_estado_proceso
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_procesos_seq
      before insert on procesos
      for each row
        when (new.id is null)
      begin
        :new.id := procesos_seq.nextval;
      end;
    SQL
  end
end
