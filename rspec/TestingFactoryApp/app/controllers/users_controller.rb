class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ['User successfully created']
      redirect_to "/users/#{@user.id}"
    else
      if not params[:first_name]
        flash[:notice1] = "First name can't be blank"
      end
      if not params[:last_name]
        flash[:notice2] = "Last name can't be blank"
      end
      if not params[:last_name]
        flash[:notice3] = "Email can't be blank"
      end
      redirect_to new_user_path
      #errors we need to code later
    end
  end

  def show 
      @user = User.find(params[:id])
  end

end
