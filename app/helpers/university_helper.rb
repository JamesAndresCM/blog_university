# helpers university
module UniversityHelper
  def majors(id_university)
    carreras_relationships = []
    University.all.map do |x|
      carreras_relationships << [x.id, University.majors_university(x.id).to_a]
    end
    @carreras = carreras_relationships.delete_if { |x| x[1].flatten.empty? }

    carreras = []
    @carreras.map do |x|
      x[1].map{ |y| carreras << [y.nombre, y.id] } if x[0].eql?(id_university)
    end
    return carreras
  end

  def admin_university_actions(id)
    if current_user && current_user.role.superadmin_role?
      (link_to 'Delete University', id,
               class: 'btn btn-sm btn-danger mt-2',
               remote: true,
               method: :delete,
               data: { confirm: 'Are you sure?' }) + ' '.html_safe +
        (link_to 'Edit University', edit_university_path(id),
                 class: 'btn btn-sm btn-primary mt-2', remote: true)
    end
  end

  def create_university
    if current_user && current_user.role.superadmin_role?
      '<br>'.html_safe + (link_to 'Create University',
               new_university_path, class: 'btn btn-sm btn-success center',
                                    remote: true, 'data-toggle' => 'modal',
                                    'data-target' => 'my-modal')
    end
  end

  def check_posts_empty(c_value)
    c_value.majors.joins(:posts).where("posts.status = (?)",1)
  end
end
