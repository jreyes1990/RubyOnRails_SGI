class CreateBitacoraDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :bitacora_documentos, id: false, comment: "Bitacora eventos del Documentos" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :documento, null: false, foreign_key: false, index: true, comment: "Identificador del documento"
      t.integer :empresa_id, null: false, comment: "Identificador de la empresa"
      t.integer :proceso_id, null: false, comment: "Identificador del proceso"
      t.integer :tipo_sistema_id, null: false, comment: "Identificador del tipo de sistema"
      t.integer :tipo_documento_id, null: false, comment: "Identificador del tipo de documento"
      t.integer :estado_documento_id, null: false, comment: "Identificador del estado de documento"
      t.string :nombre, limit: 200, null: false, comment: "Nombre del documento"
      t.string :codigo, limit: 20, null: false, comment: "Identificador del codigo del documento"
      t.integer :correlativo, null: false, comment: "Identificador del correlativo del documento"
      t.date :fecha_vigencia, null: false, comment: "Fecha lanzamiento del documento"
      t.integer :version, null: false, comment: "Identificador de la version del documento"
      t.string :descripcion, comment: "Descripción general del documento"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence bitacora_documentos_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table bitacora_documentos add
        constraint pk_bitaDocumento
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :bitacora_documentos, :documentos, column: :documento_id, name: 'fk_bitaDocumento_documento'

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table bitacora_documentos add
        constraint ck_estado_bitaDocumento
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_bitacora_documentos_seq
      before insert on bitacora_documentos
      for each row
        when (new.id is null)
      begin
        :new.id := bitacora_documentos_seq.nextval;
      end;
    SQL
  end
end
