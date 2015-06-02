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

  def edit
    @instructor = Instructor.find(params[:id])
    @courses = Course.all
  end

  def update
    @instructor = Instructor.find(params[:id])
     if @instructor.save(instructor_params)
       redirect_to instructor_path
     else
       render :edit
     end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
     @instructor.destroy
      redirect_to root_path
  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name)
  end

end
