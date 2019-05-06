# frozen_string_literal: true
class HomeController < ApplicationController
	def index
		@newsletter = Newsletter.new
	end
end