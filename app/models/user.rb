class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :admin_events, foreign_key:"admin_id", class_name:"Event"
	has_many :attendances, foreign_key:"participant_id"
	has_many :events, through: :attendances, foreign_key:"participant_id"

	#validates :first_name, presence: true
	#validates :last_name, presence: true
	validates :email, presence: true
	validates :encrypted_password, presence: true
	validates :description, presence: false


	after_create :welcome_send

	def welcome_send
	  UserMailer.welcome_email(self).deliver_now
	end


end
