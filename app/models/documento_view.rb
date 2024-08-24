class DocumentoView < ApplicationRecord
    self.table_name = "documentos_views"
    self.primary_key = :id

    def readonly?
        true
    end
end