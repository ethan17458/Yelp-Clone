class Review < ActiveRecord::Base
	belongs_to :place
	validates :author, presence: true
	validates :reviewed_place, presence: true
	validates :content, presence: true, uniqueness: {case_sensitive: false}
	validates :stars, numericality: {integer_only: true, less_than_or_equal_to: 5,
																		greater_than_or_equal_to: 1}
end
