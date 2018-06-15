class Major < ApplicationRecord
	belongs_to :university
	has_many :reviews
	has_many :courses, through: :reviews
	has_many :posts
end
