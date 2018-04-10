class DojosController < ApplicationController
  def main
    @count = Dojo.count
    @dojos = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.new(dojo_params)
    
    if @dojo.save
      redirect_to :main
    else
      render action: :new
    end
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end

end
