class PreferencesController < ApplicationController

  def index
    redirect_to '/' unless current_user
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
