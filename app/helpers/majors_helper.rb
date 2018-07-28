module MajorsHelper
  def create_course_major
    if current_user && current_user.role.superadmin_role?
      (link_to 'Agregar Asignatura a Carrera',
               edit_university_major_path, class: 'btn btn-sm btn-success',
                                           remote: true,
                                           'data-toggle' => 'modal',
                                           'data-target' => 'my-modal')
    end
  end

  def remove_course_major(major_id, course_id)
    if current_user && current_user.role.superadmin_role?
      (link_to 'Remove Course',
               "javascript:RemoveMajor(#{major_id},#{course_id})",
               class: 'btn-sm btn-danger btn')
    end
  end
end
