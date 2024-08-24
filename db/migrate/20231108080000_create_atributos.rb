class CreateAtributos < ActiveRecord::Migration[6.0]
  def change
    create_table :atributos, id: false, comment: "Catálogo de Atributos" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.string :nombre, limit: 100, null: false, comment: "Nombre del atributo"
      t.string :descripcion, null: true, comment: "Descripción general del atributo"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence atributos_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table atributos add
        constraint pk_atributo
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :atributos, [:nombre], name: "uidx_atributo", unique: true

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_atributos_seq
      before insert on atributos
      for each row
        when (new.id is null)
      begin
        :new.id := atributos_seq.nextval;
      end;
    SQL
  end
end
