class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(session_params[:email]).try(:authenticate, session_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to :root
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private
    def session_params 
      params.require(:user).permit(:email, :password)
    end
end
