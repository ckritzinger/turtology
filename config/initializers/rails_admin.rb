RailsAdmin.config do |config|

  ################  Global configuration  ################
  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Turtology', 'Admin']
  config.label_methods += [:label, :name, :description, :email, :file_name]

  def is_admin?(user)
    return true if Rails.env.development?
    user && Settings.rails_admin.admin_white_list.split(',').include?(user.email)
  end

  config.authorize_with do
    unless is_admin?(current_user)
      flash[:notice] = "You have to login with your admin email address to access the admin interface"
      redirect_to main_app.new_user_session_path
    end
  end
  config.authenticate_with do
    is_admin?(current_user)
  end

  config.current_user_method do
    current_user && current_user.email
  end

end
