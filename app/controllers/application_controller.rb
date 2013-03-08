class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :link_return
  before_filter :dvp_view
  private
  # handles storing return links in the session
  def dvp_view
    if params[:dvp_view]
      session[:dvp_view] = params[:dvp_view]
    end
  end

  def link_return
    if params[:return_uri]
      session[:original_uri] = params[:return_uri]
    end
  end
end
