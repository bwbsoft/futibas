class Groups::PlayersController < ApplicationController
  before_action :set_player, only: %i[ show ]

  def index
    @players = Player.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @page_title = "#{@player.group.name} > #{@player.name}"
    render 'groups/players/show'
  end

  # GET /groups/new
  def new
    @player = Player.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @player = Player.new(player_params)
    @player.user = current_user

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(player)
        format.html { redirect_to group_url(@player), notice: "player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @player.destroy!

    respond_to do |format|
      format.html { redirect_to @player_group, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  private
  def set_player
    @player = Player.find(params[:player_id])
  end

  def player_params
    params.require(:group).permit(:name, :notes)
  end 
end