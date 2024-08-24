class CreateMenuRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_roles, id: false, comment: "Catálogo Configuración de Menú por Roles" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :menu, null: false, foreign_key: false, index: false, comment: "Identificador del menú"
      t.references :opcion, null: false, foreign_key: false, index: false, comment: "Identificador de la opción por menú"
      t.references :rol, null: false, foreign_key: false, index: false, comment: "Identificador del rol"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence menu_roles_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table menu_roles add
        constraint pk_menu_rol
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :menu_roles, :menus, column: :menu_id, name: 'fk_menuRol_menu'
    add_foreign_key :menu_roles, :opciones, column: :opcion_id, name: 'fk_menuRol_opcion'
    add_foreign_key :menu_roles, :roles, column: :rol_id, name: 'fk_menuRol_rol'

    # Agregar el índice único con el nombre personalizado
    add_index :menu_roles, [:menu_id, :opcion_id, :rol_id], name: "uidx_menuRol", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table menu_roles add
        constraint ck_estado_menuRol
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_menu_roles_seq
      before insert on menu_roles
      for each row
        when (new.id is null)
      begin
        :new.id := menu_roles_seq.nextval;
      end;
    SQL
  end
end
