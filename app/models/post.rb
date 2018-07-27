# model Post
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :major

  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title
  validates_presence_of :body
  enum status: { unpublished: 0, published: 1 }
  mount_uploader :post_image, PostImageUploader
  scope :order_post, -> { order('created_at DESC') }
  scope :order_post_status, -> { order('status ASC') }
  scope :post_for_user, ->(user) { where(user_id: user.id) }
  scope :total_unpublished, -> { unpublished.where(created_at: 1.day.ago..Time.now) }

  def self.relationships_posts
    joins(:course).joins(major: :university)
                  .select('universities.name, posts.id, posts.user_id, posts.title,
                posts.post_image, posts.created_at, posts.slug, posts.body,
                posts.status,posts.major_id,posts.course_id,majors.nombre,
                courses.name as c_name')
  end
end
