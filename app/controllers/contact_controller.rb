class ContactController < ApplicationController
  def index
    @contact = Contact.new
    render 'contact/index'
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to root_path, notice: "Thanks, I'll be in touch!"
    else
      render 'new'
    end
  end


  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params 
    params.require(:contact).permit(:name, :email, :message)
  end
end
