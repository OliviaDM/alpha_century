class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def check_permission(record)
    redirect_to root_path unless record.user == current_user
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
