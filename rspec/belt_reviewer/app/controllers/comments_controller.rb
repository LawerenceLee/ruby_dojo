class CommentsController < ApplicationController

  def create
    @comment = Comment.new(user: current_user, event: Event.find(params[:event_id]), content: params[:content])
    if @comment.save
      flash[:notice] = "Added Comment"
    else
      flash[:errors] = @comment.errors.full_messages
    end
      redirect_to "/events/#{params[:event_id]}"
  end

end