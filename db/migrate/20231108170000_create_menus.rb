class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus, id: false, comment: "Catálogo de Menú" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.string :nombre, limit: 100, null: false, comment: "Nombre del menú"
      t.string :descripcion, null: true, comment: "Descripción general del menú"
      t.string :icono, limit: 50, null: false, comment: "Identificador de icono para el menú"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence menus_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table menus add
        constraint pk_menu
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :menus, [:nombre], name: "uidx_menu", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table menus add
        constraint ck_estado_menu
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_menus_seq
      before insert on menus
      for each row
        when (new.id is null)
      begin
        :new.id := menus_seq.nextval;
      end;
    SQL
  end
end
