# == Schema Information
#
# Table name: permiso_documento_usuarios
#
#  id                   :integer          not null, primary key
#  user_created_id      :integer
#  user_updated_id      :integer
#  estado               :string(10)
#  user_id              :integer          not null
#  permiso_documento_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'rails_helper'

RSpec.describe PermisoDocumentoUsuario, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
