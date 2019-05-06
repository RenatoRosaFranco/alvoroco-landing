# frozen_string_literal: true
class NewslettersController < ApplicationController
	before_action :find_subscription, only: [:destroy]

	def create
		newsletter = Newsletter.find_or_create_by(newsletter_params)
		redirect_to root_path, notice: 'Você se inscreveu com sucesso.'
	end

	def destroy
		newsletter.cancel
		redirect_to root_path, notice: 'Você foi removido de nossa lista.'
	end

	private

	def newsletter_params
		params.require(:newsletter)
			.permit(:email)
	end
end