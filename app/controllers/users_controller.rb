class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params.require(:user).permit(
       :first_name,:last_name,:email,:password,:password_confirmation
    )
    if @user.save
       session[:user_id] = @user.id    
       flash.notice = "Logged in!"
       redirect_to idea_factories_index_path
    else
       render :new, status: 303
    end #if-else
  end #create



  private

  def user_params
     params.require(:user).permit(:first_name, :last_name, :email)
  end #user_params

  def find_user
     @user = User.find params[:id]
  end #find_user

  def authorize!
     unless can? :crud, @user
      redirect_to root_path 
      flash[:alert] =  'Access Denied'
     end
  end #authorize!

end #controller

