class CreateOpciones < ActiveRecord::Migration[6.0]
  def change
    create_table :opciones, id: false, comment: "Catálogo de Opciones por Menú" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :menu, null: false, foreign_key: false, index: false, comment: "Identificador del menú"
      t.references :sub_opcion, null: false, foreign_key: false, index: false, comment: "Identificador de la sub-opción"
      t.string :nombre, limit: 100, null: false, comment: "Nombre de la opción"
      t.string :descripcion, null: true, comment: "Descripción general de la opción"
      t.string :icono, limit: 50, null: true, comment: "Icono que identificará la opción"
      t.string :path, null: false, comment: "Identificador de ruta de navegación"
      t.string :controlador, limit: 300, null: false, comment: "Identificador de controlador de navegación"
      t.string :componente_sidebar, null: true, comment: "Identificador el componente a utilizar en el sidebar"
      t.string :visible_sidebar, limit: 1, null: false, default: "S", comment: "El componente será visible en el sidebar?  [S: Si, N: No]"
      t.integer :posicion, null: true, comment: "Orden del componente a utilizar en el sidebar"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence opciones_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table opciones add
        constraint pk_opcion
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :opciones, :menus, column: :menu_id, name: 'fk_opcion_menu'
    add_foreign_key :opciones, :sub_opciones, column: :sub_opcion_id, name: 'fk_opcion_subOpcion'

    # Agregar el índice único con el nombre personalizado
    add_index :opciones, [:menu_id, :sub_opcion_id, :nombre], name: "uidx_opcion", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table opciones add
        constraint ck_estado_opcion
        check (estado in ('A', 'I'))
    SQL

    execute <<-SQL
      alter table opciones add
        constraint ck_tieneSidebar_opcion
        check (visible_sidebar in ('S', 'N'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_opciones_seq
      before insert on opciones
      for each row
        when (new.id is null)
      begin
        :new.id := opciones_seq.nextval;
      end;
    SQL
  end
end
