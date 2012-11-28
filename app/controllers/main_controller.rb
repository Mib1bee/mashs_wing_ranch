class MainController < ApplicationController

	layout 'main'
	
	def index
		@sauces = Sauce.order("sauces.id ASC")
	end

end
