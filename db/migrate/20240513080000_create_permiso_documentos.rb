class CreatePermisoDocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :permiso_documentos, id: false, comment: "Modulo Permisos de documento" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: true, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.references :tipo_usuario, null: false, foreign_key: false, index: false, comment: "Identificador de la clasificación del documento"
      t.references :proceso, null: false, foreign_key: false, index: false, comment: "Identificador del proceso"
      t.references :tipo_sistema, null: false, foreign_key: false, index: false, comment: "Identificador del tipo de sistema"
      t.references :tipo_documento, null: false, foreign_key: false, index: false, comment: "Identificador del tipo de documento"
      t.references :documento, null: false, foreign_key: false, index: true, comment: "Identificador del documento"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence permiso_documentos_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table permiso_documentos add
        constraint pk_permisoDocto
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :permiso_documentos, :empresas, column: :empresa_id, name: 'fk_permisoDocto_empresa'
    add_foreign_key :permiso_documentos, :tipo_usuarios, column: :tipo_usuario_id, name: 'fk_permisoDocto_tipoUsuario'
    add_foreign_key :permiso_documentos, :procesos, column: :proceso_id, name: 'fk_permisoDocto_proceso'
    add_foreign_key :permiso_documentos, :tipo_sistemas, column: :tipo_sistema_id, name: 'fk_permisoDocto_tipoSistema'
    add_foreign_key :permiso_documentos, :tipo_documentos, column: :tipo_documento_id, name: 'fk_permisoDocto_tipoDocto'
    add_foreign_key :permiso_documentos, :documentos, column: :documento_id, name: 'fk_permisoDocto_documento'

    # Agregar el índice único con el nombre personalizado
    add_index :permiso_documentos, [:empresa_id, :tipo_usuario_id, :proceso_id, :tipo_sistema_id, :tipo_documento_id, :documento_id], name: "uidx_permisoDocto", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table permiso_documentos add
        constraint ck_estado_permisoDocto
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_permiso_documentos_seq
      before insert on permiso_documentos
      for each row
        when (new.id is null)
      begin
        :new.id := permiso_documentos_seq.nextval;
      end;
    SQL
  end
end
