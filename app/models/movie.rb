class Movie < ApplicationRecord
	has_many :rentals, dependent: :destroy
	belongs_to :user 


	def status 
		if self.rentals.empty?
			return "In Stock"
		else
			self.rentals.order(borrowed_on: :desc).each do |x|
				if !x.returned_on.nil?
					return "In Stock"
				else 
					return "Rented"
				end
			end
		end
	end

	def self.search(search = nil)
  		if search
   		 Movie.where('title LIKE :search', search: "%#{search}%")
  		else
   		 Movie.all
  		end
	end
		
end
