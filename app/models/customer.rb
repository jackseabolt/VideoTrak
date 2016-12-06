class Customer < ApplicationRecord
	has_many :rentals 
	belongs_to :user

	def full_name
		"#{self.fname} #{self.lname}"
	end 

	def rental_status
		last = self.rentals.order(borrowed_on: :desc).last 
		if last.borrowed_on.nil?
			return "Currently Renting"
		else 
			return "Clear"
		end
	end 

	def self.search(search = nil)
  		if search
   		 Customer.where('lname LIKE :search', search: "%#{search}%")
  		else
   		 Customer.all
  		end
	end
end
