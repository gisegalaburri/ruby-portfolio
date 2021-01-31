class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :set_source

  def set_source
    # set the session and set source equal to q
    session[:source] = params[:q] if params[:q]
  end
end
