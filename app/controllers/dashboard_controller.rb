class DashboardController < ApplicationController
  def home
    render :home, locals: { current_user: current_user }
  end
end