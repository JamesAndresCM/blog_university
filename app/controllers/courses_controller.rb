# creacion de cursos
class CoursesController < ApplicationController
  before_action :set_course, only: %i[edit update destroy]
  load_and_authorize_resource

  def index
    @courses = Course.course_order
  end

  def edit; end

  def new
    @course = Course.new
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.js {}
    end
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      format.js {} if @course.save
    end
  end

  def update
    respond_to do |format|
      format.js {} if @course.update(course_params)
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

end
