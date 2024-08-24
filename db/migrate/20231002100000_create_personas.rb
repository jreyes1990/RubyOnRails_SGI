class CreatePersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :personas, id: false, comment: "Módulo Configuración de Usuarios" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :user, null: false, foreign_key: false, index: false, comment: "Identificador del usuario"
      t.string :nombre, limit: 100, null: false, comment: "Nombre de la persona"
      t.string :apellido, limit: 100, null: false, comment: "Apellido de la persona"
      t.text :foto, null: true, comment: "Foto de la persona"
      t.integer :telefono, limit: 8, null: false, default: 66854900, comment: "Número de celular de la persona"
      t.string :direccion
      t.string :token, limit: 1000
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence personas_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table personas add
        constraint pk_persona
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :personas, :users, column: :user_id, name: 'fk_persona_user'

    # Agregar el índice único con el nombre personalizado
    add_index :personas, [:user_id], name: "uidx_persona", unique: false

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table personas add
        constraint ck_estado_persona
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_personas_seq
      before insert on personas
      for each row
        when (new.id is null)
      begin
        :new.id := personas_seq.nextval;
      end;
    SQL
  end
end
