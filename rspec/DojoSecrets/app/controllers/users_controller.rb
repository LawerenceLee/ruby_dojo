class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :new_session
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :new_user
    end
  end

  def show
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
