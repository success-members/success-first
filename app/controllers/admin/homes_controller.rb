class Admin::HomesController < ApplicationController

	# トップページ画面
	def top
		# @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
	end
end