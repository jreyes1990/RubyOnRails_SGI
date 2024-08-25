class CreatePermisoDocumentoUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :permiso_documento_usuarios, id: false, comment: "Modulo Permisos de documento por Usuario" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: true, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.references :user, null: false, foreign_key: false, index: false, comment: "Identificador del usuario"
      t.references :permiso_documento, null: false, foreign_key: false, index: false, comment: "Identificador del permiso del documento"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence permiso_documento_usuarios_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table permiso_documento_usuarios add
        constraint pk_permisoDoctoUser
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :permiso_documento_usuarios, :empresas, column: :empresa_id, name: 'fk_permisoDoctoUser_empresa'
    add_foreign_key :permiso_documento_usuarios, :users, column: :user_id, name: 'fk_permisoDoctoUser_usuario'
    add_foreign_key :permiso_documento_usuarios, :permiso_documentos, column: :permiso_documento_id, name: 'fk_permisoDoctoUser_permDocto'

    # Agregar el índice único con el nombre personalizado
    add_index :permiso_documento_usuarios, [:empresa_id, :user_id, :permiso_documento_id], name: "uidx_permisoDoctoUser", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table permiso_documento_usuarios add
        constraint ck_estado_permisoDoctoUser
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_permiso_docto_usuario_seq
      before insert on permiso_documento_usuarios
      for each row
        when (new.id is null)
      begin
        :new.id := permiso_documento_usuarios_seq.nextval;
      end;
    SQL
  end
end
