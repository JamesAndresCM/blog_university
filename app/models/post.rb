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

  private 
  
  def self.relationships_posts
    joins(:course).joins(major: :university)
                  .select('universities.name, posts.id, posts.user_id, posts.title,
                posts.post_image, posts.created_at, posts.slug, posts.body,
                posts.status,posts.major_id,posts.course_id,majors.nombre,
                courses.name as c_name')
  end

  def self.university_posts(search)
    joins(:major => :university).where("universities.name ilike (?) and posts.status = (?)","%#{search}%" , 1)
    .select(:"universities.name", :body, :id, :title, :slug, :user_id, :created_at,:status)
  end
  
  def self.post_per_university(post)
    joins(:major => :university).where("majors.university_id = (?) and posts.status = (?)", post, 1)
    .select(:name,:slug, :title,:user_id, :created_at,:body, :status)
  end

  def self.major_university_posts(university, major)
    joins(:major => :university).where("universities.slug = (?) and majors.id = (?) and posts.status = (?)" ,university, major, 1)
    .select(:name, :slug, :title, :user_id, :created_at, :body,:status)
  end

end
