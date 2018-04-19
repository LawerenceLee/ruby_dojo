class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, only: [:show, :edit, :update, :destroy]


  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :events
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users'
    end
  end

  def edit
  end

  def update
    @user = User.update(current_user.id, edit_user_params)
    @user.update(state: params[:state])
    if @user.errors.full_messages != []
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{current_user.id}/edit"
    else 
      flash[:notice] = "Successfully updated user"
      redirect_to :events
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :location, :email, :state, :password, :password_confiramtion)
    end

    def edit_user_params
      params.require(:user).permit(:first_name, :last_name, :location, :email, :state)
    end
end
