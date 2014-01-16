class ApplicationController < ActionController::Base
  # extend ActiveSupport::Memoizable
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_visitor
    @current_visitor ||= if cookies[:visitor_id]
      Visitor.find(cookies[:visitor_id])
    else
      visitor = Visitor.create(ip_address: request.remote_ip, mobile: mobile_device?, country: get_ip(request.remote_ip), browser: browser_name)
      cookies.permanent[:visitor_id] = visitor.id
      visitor
    end
  end
  helper_method :current_visitor

  def get_ip(ip)
    HTTParty.get("http://freegeoip.net/json/#{ip}").parsed_response["country_name"]
  end


  def mobile_device?
    request.user_agent.downcase.include?("mobile")
  end
  helper_method :mobile_device?


  def browser_name
    if request.user_agent.downcase.include?("firefox")
      "firefox"
    elsif request.user_agent.downcase.include?("gecko")
      "safari"
    elsif request.user_agent.downcase.include?("msie")
      "internet explorer"
    else
      "unknown"
    end 
  end
end
