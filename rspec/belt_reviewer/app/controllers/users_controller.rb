class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to 'users'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name, :location, 
                                   :state, :password, 
                                   :password_confiramtion)
    end
end
