# frozen_string_literal: true
module API
	module V1
		class NewslettersController < ApplicationController
			def index
				@newsletters = Newsletter.all
				render json: @newsletters, status: 200
			end
		end
	end
end