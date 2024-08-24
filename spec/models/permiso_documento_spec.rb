# == Schema Information
#
# Table name: permiso_documentos
#
#  id                :integer          not null, primary key
#  tipo_usuario_id   :integer
#  proceso_id        :integer
#  tipo_sistema_id   :integer
#  documento_id      :integer
#  todo              :string(10)
#  user_created_id   :integer
#  user_updated_id   :integer
#  estado            :string(10)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tipo_documento_id :integer
#
require 'rails_helper'

RSpec.describe PermisoDocumento, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
