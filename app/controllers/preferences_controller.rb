class PreferencesController < ApplicationController

  def index
    render file: 'errors/not_found', status: 404 unless current_user
  end

  def update
    update = !current_user.notifications
    current_user.update(notifications: update)
    if update
      flash[:notice] = "You are signed up for daily text notifications"
    else
      flash[:notice] = "You are no longer signed up for daily text notifications"
    end
    redirect_to preferences_path
  end
end
