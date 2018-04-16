class LikesController < ApplicationController
  def create
    Like.create(user: current_user, secret: Secret.find(params[:secret_id]))
    redirect_to "/secrets"
  end

  def destroy
    @like = Like.where("likes.user_id = #{current_user.id} AND likes.secret_id = #{params[:secret_id]}")
    @like[0].destroy
    redirect_to "/secrets"
  end
end
