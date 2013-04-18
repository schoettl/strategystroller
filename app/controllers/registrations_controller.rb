class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  #prepend_before_filter :require_no_authentication, :only => [ :create, :cancel ]
  #prepend_before_filter :authenticate_scope!, :only => [ :new, :edit, :update, :destroy]
  #prepend_before_filter :authenticate_scope!, :only => [ :new ]

  # GET /resource/sign_up
  def new
    if current_user.controlling_unit?
      resource = build_resource({})
      respond_with resource
    else
      set_flash_message :alert, "Only Controller Units can create new users."
      redirect_to :root
    end
  end

  def create
    flash[:alert]= "User #{resource.email} has been created." if resource.valid?
    super
  end

end