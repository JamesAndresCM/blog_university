class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:author_profile]
  def index
    @posts = Post.published.order_post.paginate(page: params[:page], per_page: 10).relationships_posts
    @last_posts = Post.published.order_post.limit(3)

    if current_user && current_user.role.supervisor_role?
      @posts = Post.order_post_status.order_post.paginate(page: params[:page], per_page: 10).relationships_posts
      @total_posts_unpublished = Post.total_unpublished.count
    end
  end

  def show_author
    @user = User.friendly.find(params[:id])
    @posts_user = @user.posts.published.order_post.paginate(page: params[:page], per_page: 5).relationships_posts
  rescue StandardError
    redirect_to root_path, notice: 'Usuario no encontrado'
  end

  def author_profile
    @user = current_user
  end

  def search_post_university
      if params[:search]
      respond_to do |format|
        @posts = Post.university_posts(params[:search]).order_post.paginate(page: params[:page], per_page: 5)
        unless @posts.empty?
          format.html {  @posts  }
          format.js {}
        else
            format.html{ redirect_to root_path, notice: "University #{params[:search]} not found"  }
        end
      end
    end
  end

end
