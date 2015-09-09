class CheckinsController < ApplicationController

  def index
    @checkins = Checkin.all
    render :index
  end

  def new
    @checkin = Checkin.new
    render :new
  end


  def create
    @checkin = current_user.checkins.new(checkin_params)
      if @checkin.save
        flash[:notice] = "Successfully saved checkin."
        redirect_to checkins_path
      else
        flash[:error] = checkin.errors.full_messages.join(',')
        redirect_to checkin_path
      end
  end

  #show all checkins in db
  def show
    @checkin = Checkin.new
    @checkins = Checkin.all
  end

  def edit
  end

  def update
  end

  def destroy
    if checkin = Checkin.find(params[:id])
      if current_user
        flash[:notice] = "Successfully deleted checkin!"
        checkin.delete
        redirect_to checkin_path
      else
        flash[:error] = "You need to login in to delete post."
        redirect_to root_path
      end
    else
      flash[:error] = checkin.errors.full_messages.join(', ')
      redirect_to checkins_path
    end
  end

  private
    def checkin_params
      params.require(:checkin).permit(:first_name, :last_name, :status, :user_id)
    end
end
