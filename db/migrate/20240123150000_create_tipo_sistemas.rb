class CreateTipoSistemas < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_sistemas, id: false, comment: "Catálogo Tipo de Sistemas" do |t|
      t.integer :id, null: false, comment: "Identificador de la llave primaria"
      t.references :empresa, null: false, foreign_key: false, index: false, comment: "Identificador de la empresa"
      t.string :nombre, limit: 150, null: false, comment: "Nombre tipo de sistema"
      t.string :descripcion, comment: "Descripción general del tipo de sistema"
      t.string :abreviatura, limit: 5, null: false, comment: "Identificador de abreviatura del tipo de sistema"
      t.integer :user_created_id, null: false, comment: "Identificador de usuario al registrar en la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador de usuario al actualizar en la aplicación web"
      t.string :estado, limit: 10, null: false, default: "A", comment: "Estados: [A]: Activo  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
    end

    # Crear una secuencia para autoincrementar la columna id
    execute <<-SQL
      create sequence tipo_sistemas_seq start with 1 increment by 1 minvalue 1 nocache
    SQL

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table tipo_sistemas add
        constraint pk_tipoSistema
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :tipo_sistemas, :empresas, column: :empresa_id, name: 'fk_tipoSistema_empresa'

    # Agregar el índice único con el nombre personalizado
    add_index :tipo_sistemas, [:empresa_id, :nombre], name: "uidx_tipoSistema", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table tipo_sistemas add
        constraint ck_estado_tipoSistema
        check (estado in ('A', 'I'))
    SQL

    # Crear un trigger para asignar el valor de la secuencia a la columna id
    execute <<-SQL
      create or replace trigger trg_tipo_sistemas_seq
      before insert on tipo_sistemas
      for each row
        when (new.id is null)
      begin
        :new.id := tipo_sistemas_seq.nextval;
      end;
    SQL
  end
end
