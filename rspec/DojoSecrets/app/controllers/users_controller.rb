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

  def update
    @user = User.find(params[:id])
    if @user.update(user_edit_params)
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    if current_user.id == params[:id]
      current_user.destroy
      session["user_id"] = nil
    end
    redirect_to :new_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_edit_params
      params.require(:user).permit(:name, :email)
    end
end
