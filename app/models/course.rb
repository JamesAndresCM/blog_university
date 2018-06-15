class Course < ApplicationRecord
  has_many :reviews
  has_many :majors, through: :reviews
  scope :course_order, -> { all.order('created_at DESC') }
  has_many :post
  validates_presence_of :name
end
