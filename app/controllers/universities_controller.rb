# University Controller
class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @universities = University.university_order
  end

  def edit; end

  def new
    @university = University.new
  end

  def create
    @university = University.new(university_params)

    respond_to do |format|
      format.js {} if @university.save
    end
  end

  def show
    @carreras = University.majors_university(params[:id])
  end

  def destroy
    @university.destroy

    respond_to do |format|
      format.js {}
    end
  end

  def update
    respond_to do |format|
      format.js {} if @university.update(university_params)
    end
  end

  private

  def set_university
    @university = University.find(params[:id])
  end

  def university_params
    params.require(:university).permit(:name,
                                       :descripcion,
                                       :image,
                                       majors_attributes:
                                       %i[id nombre _destroy])
  end
end