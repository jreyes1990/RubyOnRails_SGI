class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, id: false, comment: "Catálogo de Roles" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.string :nombre, limit: 100, null: false, comment: "Nombre del rol"
      t.string :descripcion, null: true, comment: "Descripción general del rol"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence roles_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table roles add
        constraint pk_rol
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :roles, [:nombre], name: "uidx_rol", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table roles add
        constraint ck_estado_rol
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_roles_seq
      before insert on roles
      for each row
        when (new.id is null)
      begin
        :new.id := roles_seq.nextval;
      end;
    SQL
  end
end
