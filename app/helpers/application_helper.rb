module ApplicationHelper
  def usertype_helper
    if current_user.role.superadmin_role?
      raw("<li class='nav-item dropdown'>
      <a class='nav-link dropdown-toggle' href='' id='navbarDropdown'
      role='button' data-toggle='dropdown' aria-haspopup='true'
      aria-expanded='false'>
          Administracion
      </a>
      <div class='dropdown-menu' aria-labelledby='navbarDropdown'>
         <a class='dropdown-item' href=#{courses_path}>Administrar Cursos</a>
         <a class='dropdown-item' href=#{rails_admin.dashboard_path}>Panel de Administracion</a>
      </div>
    </li>"
      )
    elsif current_user.role.supervisor_role?
      raw("<a href='/' style='height: 38px;' class='btn btn-sm btn-primary'>
          Publicaciones Pendientes <span class='badge badge-light'>#{@total_posts_unpublished}</span>
          </a>")
    end
  end

  def options_user
    raw("<li class='nav-item dropdown mr-2'>
    <a class='nav-link dropdown-toggle' href='' id='navbarDropdown'
    role='button' data-toggle='dropdown' aria-haspopup='true'
    aria-expanded='false'>
        Opciones
    </a>
      <div class='dropdown-menu dropdown-margin' aria-labelledby='navbarDropdown'>
         <a class='dropdown-item' href=#{edit_user_registration_path}>Perfil</a>
         <a class='dropdown-item' data-method='delete' href=#{destroy_user_session_path}>Logout</a>
    </div>
    </li>")
  end
end
