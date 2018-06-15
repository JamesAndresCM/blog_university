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
  scope :majors_university, ->(id) { friendly.find(id).majors }
  scope :university_order, -> { all.order('created_at DESC') }
end
