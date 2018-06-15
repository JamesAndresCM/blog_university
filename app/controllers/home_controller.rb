class HomeController < ApplicationController
 # skip_before_action :authenticate_user!
  def index
    @posts = Post.published.order_post.paginate(page:params[:page],per_page:10)
    @last_posts = Post.published.order_post.limit(3)

    if current_user && current_user.role.supervisor_role?
      @posts = Post.order_post_status.order_post.paginate(page:params[:page],per_page:10)
      @total_posts_unpublished = Post.total_unpublished.count
    end
  end

  def show_author
    begin
      @user = User.find_by_id(params[:id])
      @posts_user = @user.posts.published.order_post.paginate(page:params[:page],per_page:5)
    rescue
      redirect_to "/", notice: "Usuario no encontrado"
    end
  end
end
