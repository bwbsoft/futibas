class DashboardController < ApplicationController
  layout "dashboard"

  def home
    @page_title = "Meus Grupos"
    render :home, locals: { current_user: current_user }
  end
end