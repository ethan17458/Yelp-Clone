class Place < ActiveRecord::Base
	before_destroy :destroy_reviews
	belongs_to :user
	has_many :reviews
	validates :name, presence: true
	validates :description, presence: true
	validates :owner, presence: true

	protected

		def destroy_reviews
			reviews = Review.where(author: self.owner)
			reviews.each do |review|
				review.destroy
			end
		end
end
