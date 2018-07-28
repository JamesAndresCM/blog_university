class Review < ApplicationRecord
  belongs_to :major
  belongs_to :course

  scope :course_major, ->(c_id,u_id) {where(course_id: c_id, major_id: u_id)}
end
