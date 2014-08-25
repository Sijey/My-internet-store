class ApplicationController < ActionController::Base

  def render_403
  	render file: "public/403.html", status: 403
  end
  
  def render_404
  	render file: "public/404.html", status: 404
  end
  
  protect_from_forgery with: :exception
end
