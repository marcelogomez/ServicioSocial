class LoginController < ApplicationController

  def index
    render file: 'login/index'
  end

  def login
    render file: 'login/user_login'
  end

  def do_login
    user_name = params[:login][:user_name]
    password = params[:password]
    Mail.defaults do
      retriever_method :pop3, :address    => "itesm.mx",
                       :port       => 110,
                       :user_name  => user_name,
                       :password   => password,
                       :enable_ssl => false
    end

    begin
      Mail.first
      @usuario = Usuario.find_by_matricula user_name
      if @usuario
        session[:admin] = nil
        session[:usuario] = @usuario
        redirect_to '/welcome/'
      else
        redirect_to new_usuario_path, notice: 'Tu matrícula no está registrada'
      end
    rescue Net::POPAuthenticationError # Login failed
      redirect_to :back, notice: 'Contraseña incorrecta'
    end
  end

  def admin_login
    render file: 'login/admin_login'
  end

  def do_admin_login
    user_name = params[:login][:user_name]
    password = params[:password]

    Mail.defaults do
      retriever_method :pop3, :address    => "itesm.mx",
                       :port       => 110,
                       :user_name  => user_name,
                       :password   => password,
                       :enable_ssl => false
    end

    begin
      Mail.first
      @admin = Admin.find_by_login user_name

      if@admin
        session[:user] = nil
        session[:admin] = @admin
        redirect_to '/welcome/'
      else
        redirect_to :back, notice: 'No estás registrado como administrador'
      end
    rescue Net::POPAuthenticationError # Login failed
      redirect_to :back, notice: 'Contraseña incorrecta'
    end
  end

  def logout
    session[:user] = nil
    session[:admin] = nil
  end
end
