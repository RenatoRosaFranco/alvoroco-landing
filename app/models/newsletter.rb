# frozen_string_literal: true
class Newsletter < ApplicationRecord
	include MailerInterfaceable

	self.table_name  = 'newsletters'
	self.primary_key = 'id'

	after_create :signup

	validates :email,
						presence: true,
						uniqueness: true,
						allow_blank: false,
						length: { minimum: 3, maximum: 30 }
  
  validates :token,
  					uniqueness: true

	def signup
		set_token
		set_status(true)
		set_signup_date
		send_email(NewsletterMailer, :signup, self, :deliver_now)
		save!
	end

	def cancel
		remove_token
		set_status(false)
		send_email(NewsletterMailer, :cancel, self, :deliver_now)
		save!
	end

	private

	def set_token
		self.token = SecureRandom.urlsafe_base64
	end

	def remove_token
		self.token = nil
	end

	def set_status status = true
		self.active = status
	end

	def set_signup_date date = Date.today
		self.signup_date = date
	end
end
