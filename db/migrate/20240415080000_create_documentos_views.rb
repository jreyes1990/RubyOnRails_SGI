class CreateDocumentosViews < ActiveRecord::Migration[6.0]
  def change
    create_view :documentos_views
  end
end
