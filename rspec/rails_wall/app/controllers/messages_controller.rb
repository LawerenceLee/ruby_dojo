class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def process_message
    @message = Message.new(content: params['message_box'], user: User.find(session['user_id']))

    if not @message.save
      flash[:error] = @message.errors.full_messages
    end
    redirect_to :index
  end

  def process_comment
  end
end
