class ProviderController < ApplicationController
  before_filter :authenticate_user!

  def welcome
    @user = current_user
  end

end
