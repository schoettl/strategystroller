class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  before_filter :set_locale
 
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end
def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.controlling_unit?
        controller_unit_welcome_path
      else
        provider_panel_path
      end
    elsif resource.is_a?(AdminUser)
      admin_root_path
    else
      flash[:error] = "Somehow Logged in as something other than a user or an admin." #should not be possible
      root_path
    end
  end

end
