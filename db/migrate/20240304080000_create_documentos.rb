class CreateDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :documentos, id: false, comment: "Modulo Configuración de Documentos" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.references :proceso, null: false, foreign_key: false, index: false, comment: "Identificador del proceso"
      t.references :tipo_sistema, null: false, foreign_key: false, index: false, comment: "Identificador del tipo de sistema"
      t.references :tipo_documento, null: false, foreign_key: false, index: false, comment: "Identificador del tipo de documento"
      t.references :estado_documento, null: false, foreign_key: false, index: false, comment: "Identificador del estado de documento"
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
      create sequence documentos_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table documentos add
        constraint pk_documento
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :documentos, :empresas, column: :empresa_id, name: 'fk_documento_empresa'
    add_foreign_key :documentos, :procesos, column: :proceso_id, name: 'fk_documento_proceso'
    add_foreign_key :documentos, :tipo_sistemas, column: :tipo_sistema_id, name: 'fk_documento_tipoSistema'
    add_foreign_key :documentos, :tipo_documentos, column: :tipo_documento_id, name: 'fk_documento_tipoDocumento'
    add_foreign_key :documentos, :estado_documentos, column: :estado_documento_id, name: 'fk_documento_estadoDocumento'

    # Agregar el índice único con el nombre personalizado
    add_index :documentos, [:empresa_id, :proceso_id, :tipo_sistema_id, :tipo_documento_id, :estado_documento_id, :nombre], name: "uidx_documento", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table documentos add
        constraint ck_estado_documento
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_documentos_seq
      before insert on documentos
      for each row
        when (new.id is null)
      begin
        :new.id := documentos_seq.nextval;
      end;
    SQL
  end
end
