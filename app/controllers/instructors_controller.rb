class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new

  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to instructors_path
    else
      render :new
    end
  end

  def show
    @instructor = Instructor.find(params[:id])
    @courses = Course.all

  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name)
  end

end
