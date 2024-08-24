class CreateEmpresas < ActiveRecord::Migration[6.0]
  def change
    create_table :empresas, id: false, comment: "Catálogo de Empresas" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.integer :codigo_empresa, null: false, comment: "Identificador codigo de la empresa"
      t.string :nombre, limit: 100, null: false, comment: "Nombre de la empresa"
      t.string :descripcion, null: true, comment: "Descripción general de la empresa"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence empresas_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table empresas add
        constraint pk_empresa
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :empresas, [:nombre], name: "uidx_empresa", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table empresas add
        constraint ck_estado_empresa
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_empresas_seq
      before insert on empresas
      for each row
        when (new.id is null)
      begin
        :new.id := empresas_seq.nextval;
      end;
    SQL
  end
end
