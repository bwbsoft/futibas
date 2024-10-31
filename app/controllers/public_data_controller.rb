class PublicDataController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /g/:id
  def show_group
    @group = Group.find(params[:id])
    @page_title = @group.name + " | FutApp "
    render 'groups/public/show'
  end
end