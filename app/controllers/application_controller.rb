class ApplicationController < ActionController::Base
  # extend ActiveSupport::Memoizable
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_visitor
    @current_visitor ||= if session[:visitor_id]
      Visitor.find(session[:visitor_id])
    else
      visitor = Visitor.create(ip_address: request.remote_ip, mobile: mobile_device?)
      session[:visitor_id] = visitor.id
      visitor
    end
  end
  helper_method :current_visitor

  def mobile_device?
    request.user_agent.downcase.include?("mobile")
  end
  helper_method :mobile_device?
end
