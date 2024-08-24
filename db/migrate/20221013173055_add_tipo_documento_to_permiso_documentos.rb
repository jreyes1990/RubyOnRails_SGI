class AddTipoDocumentoToPermisoDocumentos < ActiveRecord::Migration[6.0]
  def change
    add_column :permiso_documentos, :tipo_documento_id, :integer
  end
end
