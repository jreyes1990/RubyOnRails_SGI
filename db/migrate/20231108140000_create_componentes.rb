class CreateComponentes < ActiveRecord::Migration[6.0]
  def change
    create_table :componentes, id: false, comment: "Catálogo de Componentes" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.string :nombre, limit: 100, null: false, comment: "Nombre del componente"
      t.string :descripcion, comment: "Descripción general del componente"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence componentes_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table componentes add
        constraint pk_componente
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :componentes, [:nombre], name: "uidx_componente", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table componentes add
        constraint ck_estado_componente
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_componentes_seq
      before insert on componentes
      for each row
        when (new.id is null)
      begin
        :new.id := componentes_seq.nextval;
      end;
    SQL
  end
end
