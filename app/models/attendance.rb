class Attendance < ApplicationRecord
	belongs_to :event
	belongs_to :participant, class_name:"User"


	after_create :confirmation_send
	def confirmation_send
	  UserMailer.confirmation_email(self.participant,self.event).deliver_now
	end
end
