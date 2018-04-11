class UsersController < ApplicationController
  # layouts 'two_column'
  def index
    @user = User.new
    @users = User.all
    render layout: "two_column"
  end

end
