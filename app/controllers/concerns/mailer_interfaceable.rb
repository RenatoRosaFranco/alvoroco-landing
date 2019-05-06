# frozen_string_literal: true
module MailerInterfaceable
	include ActiveSupport::Concern
	
	def send_email(mailer_klass, method, object, deliver_method = :deliver_now)
		mailer_klass.send(method, object).send(deliver_method)
	end
end