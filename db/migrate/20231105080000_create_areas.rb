class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas, id: false, comment: "Catálogo de Áreas por Empresa" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.string :nombre, limit: 100, null: false, comment: "Nombre del área"
      t.string :descripcion, comment: "Descripción general del área"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence areas_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table areas add
        constraint pk_area
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :areas, :empresas, column: :empresa_id, name: 'fk_area_empresa'

    # Agregar el índice único con el nombre personalizado
    add_index :areas, [:empresa_id, :nombre], name: "uidx_area", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table areas add
        constraint ck_estado_area
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_areas_seq
      before insert on areas
      for each row
        when (new.id is null)
      begin
        :new.id := areas_seq.nextval;
      end;
    SQL
  end
end
