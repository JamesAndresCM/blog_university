# controller para guardar review
class MajorsController < ApplicationController
  before_action :set_mayor, only: %i[edit show update destroy]
  before_action :fetch_courses, only: %i[edit]
  before_action :fetch_majors, only: %i[show update]
  before_action :set_university, only: %i[edit show]
  load_and_authorize_resource

  def edit; end

  def show; end

  def update
    @course = Course.find(params[:major]['course_ids'])

    respond_to do |format|
      format.html { redirect_to university_major_path } if @course.reviews.create(major: @major)
    end
  end

  def destroy
    @course = Course.find(params[:major_id])
    @review = Review.where(course_id: @course, major_id: @major)

    respond_to do |format|
      format.html { redirect_to university_major_path } if @review.destroy_all
    end
    # render json: JSON.pretty_generate(JSON.parse(@review.to_json))
  end

  private

  def set_mayor
    @major = Major.find(params[:id])
  rescue StandardError
    redirect_to universities_path, notice: 'Asignatura no encontrada'
  end

  def set_university
    @university = University.friendly.find(params[:university_id])
  end

  # retorna los ids de los cursos que no estan asociados a carrera
  def fetch_courses
    @courses = Course.all.where.not(id: University.friendly.find(params[:university_id])
                                                  .majors
                                                  .find(params[:id])
                                                  .courses.ids)
  end

  # retorna cursos asignados a una carrera
  def fetch_majors
    @majors = University.friendly.find(params[:university_id])
                        .majors
                        .find(params[:id])
                        .courses
  end
end
