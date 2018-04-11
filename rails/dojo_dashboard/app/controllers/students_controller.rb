class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  def new
    @student = Student.new
    @selected_dojo = Dojo.find(params["dojo_id"])
    @dojos = Dojo.where("id != #{params['dojo_id']}")
  end
  
  def create
    @student = Student.new(student_params)
    @student.dojo = Dojo.find(params['dojo_id'])
    
    if @student.save
      redirect_to "/dojos/#{@student.dojo.id}"
    else
      redirect_to "/dojos/#{params['dojo_id']}/students/new" 
    end
  end
  
  def show
    date = @student.created_at.strftime("%Y-%m-%d")
    @cohort = Student.where("dojo_id=#{params[:dojo_id]} AND created_at LIKE '#{date}%' AND id!=#{@student.id}")
  end
  
  def edit
    @dojos.where("id != params['dojo_id']")
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Successfully Updated User"
      redirect_to "/dojos/#{params['dojo_id']}/students/#{params['id']}"
    else
      redirect_to "/dojos/#{params['dojo_id']}/students/#{params['id']}/edit"
    end
  end

  def destroy
    if not @student.destroy
      flash[:error] = "Cannot Destroy what does not exist"
    end
    redirect_to :main
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo, :dojo_id)
    end
end
