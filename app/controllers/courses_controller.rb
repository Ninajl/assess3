class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @instructors = Instructor.all
    @students = Student.all
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
    @students = Student.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    params[:course][:instructor_id]
    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:subject, :instructor_id, :student_id)
  end

end
