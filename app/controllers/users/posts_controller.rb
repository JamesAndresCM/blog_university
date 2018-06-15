module Users

  #post-user controller
  class PostsController < ApplicationController
    before_action :check_university
    before_action :set_post, only: %i[show edit update destroy post_status]
    load_and_authorize_resource

    # GET /posts
    # GET /posts.json
    def index
      @posts = Post.post_for_user(current_user).order_post.paginate(page:params[:page],per_page:10)
    end

    # GET /posts/1
    # GET /posts/1.json
    def show; end

    # GET /posts/new
    def new
      @post = Post.new
      @majors = Major.all.where(university_id: current_user.university_id)
    end

    # GET /posts/1/edit
    def edit
      @majors = Major.all.where(university_id: current_user.university_id)
    end

    # POST /posts
    # POST /posts.json
    def create
      @post = current_user.posts.new(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to users_posts_path, notice: 'Post was successfully created.'}
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to users_posts_path, notice: 'Post was successfully updated.'}
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def post_status
      if @post.unpublished?
        @post.published!
      elsif @post.published?
        @post.unpublished!
      end
      redirect_to root_path, notice: 'Post status has been updated.'
    end

    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to users_posts_path, notice: 'Post was successfully destroyed.'}
        format.json { head :no_content }
      end
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title,:body, :user_id, :course_id, :major_id,
                                   :post_image, :status)
    end

    def check_university
      if current_user && current_user.university_id.nil?
        respond_to do |format|
          format.html { redirect_to edit_user_registration_path }
        end
      end
    end
  end
end