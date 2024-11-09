class DocumentoView < ApplicationRecord
    self.table_name = "documentos_views"
    self.primary_key = :id

    def self.permiso_para_usuario(user_id)
        where("EXISTS (
                SELECT 1
                FROM PERMISO_DOCUMENTOS x
                WHERE DOCUMENTOS_VIEWS.PROCESO_ID = (CASE WHEN x.PROCESO_ID=0 THEN DOCUMENTOS_VIEWS.PROCESO_ID ELSE x.PROCESO_ID END)
                AND DOCUMENTOS_VIEWS.TIPO_SISTEMA_ID = (CASE WHEN x.TIPO_SISTEMA_ID=0 THEN DOCUMENTOS_VIEWS.TIPO_SISTEMA_ID ELSE x.TIPO_SISTEMA_ID END)
                AND DOCUMENTOS_VIEWS.TIPO_DOCUMENTO_ID = (CASE WHEN x.TIPO_DOCUMENTO_ID=0 THEN DOCUMENTOS_VIEWS.TIPO_DOCUMENTO_ID ELSE x.TIPO_DOCUMENTO_ID END)
                AND DOCUMENTOS_VIEWS.ID = (CASE WHEN x.DOCUMENTO_ID=0 THEN DOCUMENTOS_VIEWS.ID ELSE x.DOCUMENTO_ID END)
                AND EXISTS (
                    SELECT 1
                    FROM PERMISO_DOCUMENTO_USUARIOS xx
                    WHERE x.ID = xx.PERMISO_DOCUMENTO_ID
                    AND xx.USER_ID = ?
                    AND xx.ESTADO = ?
                )
            )", user_id, "A")
        .where.not(id: 0)
    end

    def readonly?
        true
    end
end
