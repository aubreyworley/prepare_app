class CheckinsController < ApplicationController
  
  #show all checkins in db
  def index
    @checkins = Checkin.all
    render :index
  end

# form to create new checkin that belongs to current_user
  def new
    @checkin = Checkin.new
    render :new
  end

  def create
    checkin = current_user.checkins.create(checkin_params)
    redirect_to checkin_path(checkin)
  end

  def show
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def checkin_params
      params.require(:checkin).permit(:first_name, :last_name, :status)
    end
end
