class CreateActividades < ActiveRecord::Migration[6.0]
  def change
    create_table :actividades, id: false, comment: "Modulo Actividades del proceso" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.references :proceso, null: false, foreign_key: false, index: false, comment: "Identificador del proceso"
      t.string :nombre, limit: 150, null: false, comment: "Nombre de la actividad"
      t.string :descripcion, comment: "Descripción general de la actividad"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence actividades_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table actividades add
        constraint pk_actividad
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :actividades, :empresas, column: :empresa_id, name: 'fk_actividad_empresa'
    add_foreign_key :actividades, :procesos, column: :proceso_id, name: 'fk_actividad_proceso'

    # Agregar el índice único con el nombre personalizado
    add_index :actividades, [:empresa_id, :proceso_id, :nombre], name: "uidx_actividad", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table actividades add
        constraint ck_estado_actividad
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_actividades_seq
      before insert on actividades
      for each row
        when (new.id is null)
      begin
        :new.id := actividades_seq.nextval;
      end;
    SQL
  end
end
