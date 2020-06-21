class Event < ApplicationRecord

	belongs_to :admin, class_name:"User"
	has_many :attendances
	has_many :participants, through: :attendances, class_name:"User"

	validates :title, presence: true, length:{in: 5..140}
	validates :start_date, presence: true
	validates :location, presence: true
	validates :duration, presence: true, numericality:{greater_than:0}
	validates :description, presence: true, length:{in: 20..1000}
	validates :price, presence: true, numericality:{greater_than_or_equal_to:1, less_than_or_equal_to:1000}

	validate :isnt_passed
	validate :is_multiple_of_five


	def isnt_passed
		if self.start_date <= Time.now
			errors.add(:start_date, "can't be passed")
		end
	end

	def is_multiple_of_five
		if self.duration%5 != 0
			errors.add(:duration, "must be a multiple of five")
		end
	end

end
