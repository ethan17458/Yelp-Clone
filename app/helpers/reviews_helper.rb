module ReviewsHelper
	def print_stars(stars)
		html = ""
		stars.times do 
			html += '<span class="glyphicon glyphicon-star"></span>'
		end
		(5 - stars).times do
			html += '<span class="glyphicon glyphicon-star-empty"></span>'
		end
		return html.html_safe
	end
end
