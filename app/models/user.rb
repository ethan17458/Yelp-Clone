class User < ActiveRecord::Base
	before_destroy :destroy_places
	has_many :places
	validates :username, presence: true, length: {maximum: 50},
	uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: {minimum: 6}

	protected

		def destroy_places
			places = Place.where(owner: self.id)
			places.each do |place|
				place.destroy
			end
		end
end
