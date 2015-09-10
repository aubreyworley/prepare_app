class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
    render :index
  end

  def new
    @contact = Contact.new
    render :new
  end

  def create
  @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to profile_path
    else
      flash[:error] = "Oops! Try saving your contact again."
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find_by(params[:id])
    render json: @contact
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find(contact_id)
  end

  def update
    contact_id = params[:id]
    contact = Contact.find(contact_id)
    update_params = params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
    if contact.update_attributes(update_params)
      redirect_to profile_path
    else
      redirect_to profile_path
      flash[:error] = "Oops! Try updating again!"
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to profile_path
  end

  private
    def contact_params
      params.require(:contact).permit(:user_id, :first_name, :last_name, :phone_number, :email)
    end

end
