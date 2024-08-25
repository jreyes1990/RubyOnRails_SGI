class CreateEtapaDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :etapa_documentos, id: false, comment: "Catálogo Etapa de Documentos" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.string :nombre, limit: 150, null: false, comment: "Nombre de la etapa del documento"
      t.string :descripcion, comment: "Descripción general de la etapa del documento"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence etapa_documentos_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table etapa_documentos add
        constraint pk_etapaDocumento
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :etapa_documentos, [:nombre], name: "uidx_etapaDocumento", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table etapa_documentos add
        constraint ck_estado_etapaDocumento
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_etapa_documentos_seq
      before insert on etapa_documentos
      for each row
        when (new.id is null)
      begin
        :new.id := etapa_documentos_seq.nextval;
      end;
    SQL
  end
end
