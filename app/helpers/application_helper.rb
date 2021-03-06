module ApplicationHelper
  def require_logged_in
    redirect_to root_path and return unless is_authenticated?
  end

  def is_authenticated?
    return !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
