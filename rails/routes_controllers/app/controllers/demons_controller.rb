class DemonsController < ApplicationController
  def hello
    render text: "Hello CodingDojo!"
  end

  def index
    render text: "What do you want me to say?"
  end

  def say
    if params['name'].nil?
      render text: "Saying Hello!"
    else
      render text: 'What do you want me to say?'
    end
  end

  def joe
    render text: "Saying Hello Joe!"
  end

  def michael
    redirect_to "/say/hello/joe"
  end

  def times
    if not session['times']
      session['times'] = 1
    else
      session['times'] += 1
    end
    render text: "You have visited this url #{session['times']} time/s"
  end

  def restart
    session.clear
    render text: "Destroyed the session!"
  end
end
