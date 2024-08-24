class UserMailer < ApplicationMailer
  before_action :set_base_url

  def set_base_url
    if Rails.env.development?
      @base_url = 'http://localhost:3000'
      @from_url = 'developer.madretierragt@gmail.com'
    else
      @base_url = 'https://sgi.sistemasmt.com.gt'
      @from_url = 'sistemas@madretierra.com.gt'
    end
  end

  def registro_exitoso(usuario, temp_password, correo_electronico)
    @email = correo_electronico
    @temp_password = temp_password
    @usuario = usuario
    @ruta_url = "#{@base_url}/users/sign_in"
    mail(to: @email, from: @from_url, subject: 'Bienvenido a sistema de gestión integrado: tus credenciales de acceso.')
  end

  def remitente_exitoso(usuario, temp_password, correo_electronico)
    @email = correo_electronico
    @temp_password = temp_password
    @usuario = usuario
    @ruta_url = "#{@base_url}/users/sign_in"
    mail(to: @email, from: @from_url, subject: 'Bienvenido a sistema de gestión integrado: tus credenciales de acceso.')
  end
end
