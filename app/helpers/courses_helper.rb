module CoursesHelper
  def create_course
    if current_user.role.superadmin_role?
      (link_to 'Create Course',
               new_course_path, class: 'btn btn-sm btn-success',
                                remote: true, 'data-toggle' => 'modal',
                                'data-target' => 'my-modal')
    end
  end
end
