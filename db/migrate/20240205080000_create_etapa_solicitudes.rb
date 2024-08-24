class CreateEtapaSolicitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :etapa_solicitudes, id: false, comment: "Catálogo Etapa de Solicitudes" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.string :nombre, limit: 150, null: false, comment: "Nombre de la etapa de la solicitud"
      t.string :descripcion, comment: "Descripción general de la etapa de la solicitud"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence etapa_solicitudes_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table etapa_solicitudes add
        constraint pk_etapaSolicitud
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :etapa_solicitudes, :empresas, column: :empresa_id, name: 'fk_etapaSolicitud_empresa'

    # Agregar el índice único con el nombre personalizado
    add_index :etapa_solicitudes, [:empresa_id, :nombre], name: "uidx_etapaSolicitud", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table etapa_solicitudes add
        constraint ck_estado_etapaSolicitud
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_etapa_solicitudes_seq
      before insert on etapa_solicitudes
      for each row
        when (new.id is null)
      begin
        :new.id := etapa_solicitudes_seq.nextval;
      end;
    SQL
  end
end
