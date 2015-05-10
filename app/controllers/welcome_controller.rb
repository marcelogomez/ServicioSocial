class WelcomeController < ApplicationController
  before_action :set_is_admin

  def set_is_admin
    @is_admin = session[:admin] != nil
  end

  def index
    render :file => 'welcome/index'
  end
end
