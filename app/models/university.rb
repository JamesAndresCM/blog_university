# model University
class University < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :majors, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :descripcion

  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :majors, allow_destroy: true, reject_if: ->(attrs) { attrs['nombre'].blank? }
  scope :majors_university, ->(id) { friendly.joins(majors: :courses).where(id: id) }
  scope :university_order, -> { all.order(created_at: :desc) }

  def self.university_courses(u_id)
    left_outer_joins(majors: :courses)
      .where('majors.id = (?)', u_id)
      .select('universities.id as u_id,universities.name as u_name, majors.nombre, majors.id as id_mayor,
                courses.name as c_name, courses.id as id_course')
  end

  scope :courses_majors, ->(u_id, id) { friendly.find(u_id).majors.find(id).courses }

  def self.course_ids(un_id, id)
    joins(majors: :courses).where(slug: un_id, 'majors.id' => id)
                           .select('courses.id')
  end
end
