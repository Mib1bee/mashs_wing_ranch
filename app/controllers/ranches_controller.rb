class RanchesController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def index
  	list
  	render('list')
  end

  def list
  	@pagetitle = "Ranches List"
  	@ranches = Ranch.order("ranches.id ASC")
    @item = "Ranch"
    @json = Ranch.all.to_gmaps4rails
  end

  def new
    @pagetitle = "Create New Ranch"
  end

  def create
    # Instantiate a new object using form parameters
    @ranch = Ranch.new(params[:ranch])
    # Save the object
    if @ranch.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "New Ranch Was Created Successfully."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
      render('new')
   end
  end

    def edit
    @ranch = Ranch.find(params[:id])
    @pagetitle = "Edit #{@ranch.name} Details"
  end
  
  def update
    @ranch = Ranch.find(params[:id])
    if @ranch.update_attributes(params[:ranch])
      flash[:notice] = "#{@ranch.name} Updated Successfylly."
      redirect_to(:action => 'list')
    else
      @pagetitle = "Edit #{@ranch.name} Details"
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
      render('edit')
    end
  end

  def delete
    @ranch = Ranch.find(params[:id])
    @pagetitle = "Delete #{@ranch.name}"
    flash[:error] = "Are you sure you want to delete #{@ranch.name}?"
  end
  
  def destroy
    Ranch.find(params[:id]).destroy
    flash[:notice] = "Ranch Successfylly Deleted"
    redirect_to(:action => 'list')
  end

end