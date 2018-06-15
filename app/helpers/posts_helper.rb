module PostsHelper
  def post_actions(id_post_user, post)
    if current_user && current_user.id == id_post_user
      (link_to 'Editar Publicacion',
               edit_users_post_path(post), class: 'btn btn-sm btn-primary') +
        " ".html_safe +
        (link_to 'Eliminar Publicacion',
                 users_post_path(post), class: 'btn btn-sm btn-danger', method: :delete,
                                        data: { confirm: 'Are you sure?' })
    end
  end

  def publish_post(post)
    if current_user && (current_user.role.supervisor_role? || current_user.role.superadmin_role?)
      if post.unpublished?
        (link_to 'Publicar',
                 post_status_users_post_path(post), class: 'ml-1 btn btn-sm btn-success')
      elsif post.published?
        (link_to 'No Publicar',
                 post_status_users_post_path(post), class: 'ml-1 btn btn-sm btn-warning')
        end
    end
  end
end
