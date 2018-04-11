class DojosController < ApplicationController
  before_action :set_dojo, only: [:show, :edit, :update, :destroy]
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


  def show
  end


  def edit
  end


  def update
    if @dojo.update(dojo_params)
      flash[:success] = "Successfully Updated a Dojo with id = #{@dojo.id}"
      redirect_to "/dojos/#{@dojo.id}"
    else
      render action: :edit
    end
  end


  def destroy
    if not @dojo.destroy
      flash[:error] = "Cannot Destroy what does not exist"
    end
    redirect_to :main
  end


  private
    def set_dojo
      @dojo = Dojo.find(params[:dojo_id])
    end


    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end

end
