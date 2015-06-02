class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @instructors = Instructor.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    params[:course][:instructor_id]
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:subject, :instructor_id, :student_id)
  end

end
