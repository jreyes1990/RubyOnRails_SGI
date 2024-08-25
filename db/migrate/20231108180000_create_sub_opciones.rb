class CreateSubOpciones < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_opciones, id: false, comment: "Catálogo de Sub-Opciones" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.string :nombre, limit: 100, null: false, default: "OPCIONES:", comment: "Nombre de la sub-opción"
      t.string :descripcion, null: true, comment: "Descripción general de la sub-opción"
      t.string :visible_sidebar, limit: 1, null: false, default: "S", comment: "La sub-opción será visible en el sidebar?  [S: Si, N: No]"
      t.integer :posicion, null: true, comment: "Orden de la sub-opción a utilizar en el sidebar"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
      # t.timestamps
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence sub_opciones_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table sub_opciones add
        constraint pk_subOpcion
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :sub_opciones, [:nombre], name: "uidx_subOpcion", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table sub_opciones add
        constraint ck_estado_subOpcion
        check (estado in ('A', 'I'))
    SQL

    execute <<-SQL
      alter table sub_opciones add
        constraint ck_tieneSidebar_subOpcion
        check (visible_sidebar in ('S', 'N'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_sub_opciones_seq
      before insert on sub_opciones
      for each row
        when (new.id is null)
      begin
        :new.id := sub_opciones_seq.nextval;
      end;
    SQL
  end
end
