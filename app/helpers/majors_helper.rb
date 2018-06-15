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

  def remove_course_major(major_id)
    if current_user && current_user.role.superadmin_role?
      '<hr>'.html_safe + (button_to 'Remove Asignatura',
                                      [@university, @major , major_id: major_id],
                                    class: 'btn btn-sm btn-danger mt-2',
                                    remote: true,
                                    method: :delete,
                                    data: { confirm: 'Are you sure?' })
    end
  end
end
