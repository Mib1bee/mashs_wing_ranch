class SaucesController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def index
  	list
  	render('list')
  end

  def list
  	@pagetitle = "Sauces List"
  	@sauces = Sauce.order("sauces.id ASC")
    @item = "Sauce"
  end

  def show
    @sauce = Sauce.find(params[:id])
    @pagetitle = "#{@sauce.name} Detailed View"
  end

  def new
    @pagetitle = "Create New Sauce"
    @heat_level_list = [1,2,3,4,5]
  end

  def create
    # Instantiate a new object using form parameters
    @heat_level_list = [1,2,3,4,5]
    @pagetitle = "Create New Sauce"
    @sauce = Sauce.new(params[:sauce])
    # Save the object
    if @sauce.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "New Sauce Was Created Successfully."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
      render('new')
   end
  end

  def edit
    @sauce = Sauce.find(params[:id])
    @pagetitle = "Edit #{@sauce.name} Sauce"
    @heat_level_list = [1,2,3,4,5]
  end
  
  def update
    @sauce = Sauce.find(params[:id])
    if @sauce.update_attributes(params[:sauce])
      @heat_level_list = [1,2,3,4,5]
      flash[:notice] = "#{@sauce.name} Updated Successfylly."
      redirect_to(:action => 'show', :id => @sauce.id)
    else
      @pagetitle = "Edit #{@sauce.name} Sauce"
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
      render('edit')
    end
  end

  def delete
    @sauce = Sauce.find(params[:id])
    @pagetitle = "Delete #{@sauce.name} Sauce"
    flash[:error] = "Are you sure you want to delete #{@sauce.name} sauce?"
  end
  
  def destroy
    Sauce.find(params[:id]).destroy
    flash[:notice] = "Sauce Successfylly Deleted"
    redirect_to(:action => 'list')
  end

end
