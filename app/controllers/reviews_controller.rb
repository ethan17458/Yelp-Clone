class ReviewsController < ApplicationController
	before_action :ensure_author_present, only: [:create]

	def index 
		redirect_to root_path
	end

	def new
	end

	def create
		@review = Review.new(review_params)
		
		respond_to do |format|
			if @review.save
				format.html { redirect_to root_path, notice: "Your review was submitted successfully" }
			else
				format.html { redirect_to root_path, notice: @review.errors.messages }
			end
		end
	end

	def edit
		@review = Review.find_by(id: params[:id])
	end

	def update
	end

	def destroy
	end

	private

		def review_params
			params.require(:review).permit(:author, :reviewed_place, :content, :stars)
		end

		def ensure_author_present
			if !params[:review][:author].nil?
				return true
			else
				flash[:danger] = "You are not logged in"
				redirect_to root_path
			end 
		end
end
