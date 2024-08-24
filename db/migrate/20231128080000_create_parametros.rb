class CreateParametros < ActiveRecord::Migration[6.0]
  def change
    create_table :parametros, id: false, comment: "Módulo Configuración de parametros de usuario" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.references :area, null: false, foreign_key: false, index: false, comment: "Identificador del área"
      t.references :user, null: false, foreign_key: false, index: false, comment: "Identificador del usuario"
      t.string :nombre_area
      t.string :nombre_empresa
      t.string :ruta_predeterminada
      t.string :view_default

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence parametros_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table parametros add
        constraint pk_parametro
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :parametros, :empresas, column: :empresa_id, name: 'fk_parametro_empresa'
    add_foreign_key :parametros, :areas, column: :area_id, name: 'fk_parametro_area'
    add_foreign_key :parametros, :users, column: :user_id, name: 'fk_parametro_user'

    # Agregar el índice único con el nombre personalizado
    add_index :parametros, [:empresa_id, :area_id, :user_id], name: "uidx_parametro", unique: true

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_parametros_seq
      before insert on parametros
      for each row
        when (new.id is null)
      begin
        :new.id := parametros_seq.nextval;
      end;
    SQL
  end
end
