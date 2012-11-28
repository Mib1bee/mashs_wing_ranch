class RanchLocationsController < ApplicationController

	layout 'secondary'

	def index
		locations
		render('locations')
	end

	def locations
	@ranches = Ranch.all
      @json = Ranch.all.to_gmaps4rails
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ranches }
  end
	end

end
