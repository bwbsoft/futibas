class GroupsControllerBase < ApplicationController
  layout "groups"

  def set_group
    @group = Group.find(params[:group_id])
  end
end