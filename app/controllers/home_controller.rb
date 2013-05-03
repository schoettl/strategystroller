class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = current_user
    if @user.controlling_unit
      app = Application.all.count
      if app > 0
        redirect_to create_users_path
      else
        redirect_to setup_system_path
      end
    else
      redirect_to forms_composite_path
    end
  end
end
