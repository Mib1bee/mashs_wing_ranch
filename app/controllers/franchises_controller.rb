class FranchisesController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def index
  	list
  	render('list')
  end

  def list
  	@pagetitle = "Franchise Applications"
  	@franchises = Franchise.order("franchises.created_at ASC")
  	flash[:notice] = nil
  end

  def delete
    @franchise = Franchise.find(params[:id])
    @pagetitle = "Delete Franchise Application"
    flash[:error] = "Are you sure you want to delete #{@franchise.first_name} #{@franchise.second_name}'s Franchise Application?"
  end
  
  def destroy
    Franchise.find(params[:id]).destroy
    flash[:notice] = "Franchise Application Successfylly Deleted"
    redirect_to(:action => 'list')
  end

end
