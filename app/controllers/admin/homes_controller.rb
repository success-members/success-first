class Admin::HomesController < ApplicationController
	def home
=======

	#before_action :authenticate_admin!

	# トップページ画面
	def top
		@orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
	end
end