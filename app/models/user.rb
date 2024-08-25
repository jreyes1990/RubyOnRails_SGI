# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  user_created_id        :integer
#  user_updated_id        :integer
#  estado                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :persona, dependent: :destroy
  after_create :set_persona
  has_many :permiso_documento_usuarios

  def set_persona
    self.persona = Persona.create()
  end

  def active_for_authentication?
    if self.estado == 'I'
      super && false
    else
      super && true
    end
  end
end
