class DashboardController < ApplicationController
  layout "dashboard"

  def home
    @page_title = "Meus Grupos"
    @groups = current_user.groups
    render :home, locals: { current_user: current_user }
  end
end