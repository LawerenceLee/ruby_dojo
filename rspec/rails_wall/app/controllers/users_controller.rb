class UsersController < ApplicationController
  def new
  end

  def sign_in
    @user = User.new(username: params['username'])

    if @user.save
      session['user_id'] = @user.id
      session['username'] = @user.username
      flash[:notice] = "Welcome, #{@user['username']}"
      redirect_to :index
    else
      if @user.errors.full_messages.include?("Username has already been taken")
        @user = User.where("users.username = '#{params['username']}'")
        session['user_id'] = @user[0]['id']
        session['username'] = @user[0]['username']
        flash[:notice] = "Welcome, #{@user[0]['username']}"
        redirect_to :index
      else
        flash[:error] = @user.errors.full_messages
        redirect_to :new_user
      end
    end
  end

  def log_out
    session.clear
    redirect_to :new_user
  end

end
