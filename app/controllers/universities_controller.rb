# University Controller
class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[show edit update destroy show_posts]
  load_and_authorize_resource

  def index
    @universities = University.includes(:majors).left_outer_joins(:majors).university_order.uniq
  end

  def edit; end

  def new
    @university = University.new
  end

  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.js {}
      else
        format.js { 'create' }
      end
    end
  end

  def show
    @carreras = University.majors_university(params[:id])
  end
  
  def show_posts
    @posts_university = Post.post_per_university(params[:id]).order_post.paginate(page: params[:page], per_page: 5)
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

  def search_data
    @universities = University.order(:name).where("name ilike ?", "%#{params[:term]}%")
    render json: @universities.map(&:name)
  end

  private

  def set_university
    @university = University.friendly.find(params[:id])
  rescue StandardError
    redirect_to universities_path, notice: 'Universidad no encontrada'
  end

  def university_params
    params.require(:university).permit(:name,
                                       :descripcion,
                                       :direccion,
                                       :phone_number,
                                       :image,
                                       majors_attributes:
                                       %i[id nombre _destroy])
  end
end
