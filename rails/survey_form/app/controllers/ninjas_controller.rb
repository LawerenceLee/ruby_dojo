class NinjasController < ApplicationController

  def new
    @ninja = Ninja.new
  end

  def create
    @ninja = Ninja.new(ninja_params)
    if @ninja.save
      session['ninja_id'] = @ninja.id
      if not session['submits']
        session['submits'] = 0
      end
      session['submits'] += 1
      flash[:success] = "Thanks for submitting this form! You have submitted this form #{session['submits']}"
      redirect_to "/result"
    else
      render action: 'new'
    end
  end

  def result
    @ninja = Ninja.find(session['ninja_id'])
  end

  private
    def ninja_params
      params.require(:ninja).permit(:name, :location, :language, :comment)
    end
end
