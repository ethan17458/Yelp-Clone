module ApplicationHelper
	def show_notices
		if !flash.empty?
			flash.each do |key, value|
				if notice
					flash_html = "<div class=\"alert alert-info\">" + value.to_s + "</div>"
				else
					flash_html = "<div class=\"alert alert-#{key.to_s}\">" + value.to_s + "</div>"
				end
				return flash_html.html_safe
			end
		end
	end
end
