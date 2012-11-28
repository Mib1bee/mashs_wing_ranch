class MenusController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def index
  	list
  	render('list')
  end

  def list
  	@pagetitle = "Menu Items"
    @item = "Menu Item"
  	@chicken = Menu.chicken.order("menus.id ASC")
    @burgers = Menu.burgers.order("menus.id ASC")
    @hotdogs = Menu.hotdogs.order("menus.id ASC")
    @subs = Menu.gsubs.order("menus.id ASC")
    @wraps_salads = Menu.wraps.order("menus.id ASC")
    @sizzlers = Menu.sizzlers.order("menus.id ASC")
    @sides = Menu.sides.order("menus.id ASC")
  end

  def show
    @menu = Menu.find(params[:id])
    @pagetitle = "#{@menu.item} Detailed View"
  end

  def new
    @pagetitle = "Create New Menu Item"
    @category_list = ["Chicken","Burgers","Hot Dogs","Grilled Subs","Wraps & Salads","Sizzlers","Sides"]
  end

  def create
    # Instantiate a new object using form parameters
    @pagetitle = "Create New Menu Item"
    @category_list = ["Chicken","Burgers","Hot Dogs","Grilled Subs","Wraps & Salads","Sizzlers","Sides"]
    @menu = Menu.new(params[:menu])
    # Save the object
    if @menu.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "New Menu Item Was Created Successfully."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
      render('new')
   end
  end

  def edit
    @category_list = ["Chicken","Burgers","Hot Dogs","Grilled Subs","Wraps & Salads","Sizzlers","Sides"]
    @menu = Menu.find(params[:id])
    @pagetitle = "Edit #{@menu.item}"
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      @category_list = ["Chicken","Burgers","Hot Dogs","Grilled Subs","Wraps & Salads","Sizzlers","Sides"]
      flash[:notice] = "#{@menu.item} Updated Successfylly."
      redirect_to(:action => 'show', :id => @menu.id)
    else
      @pagetitle = "Edit #{@menu.item}"
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
      render('edit')
    end
  end

  def delete
    @menu = Menu.find(params[:id])
    @pagetitle = "Delete #{@menu.item} From The Menu"
    flash[:error] = "Are you sure you want to delete #{@menu.item}?"
  end
  
  def destroy
    Menu.find(params[:id]).destroy
    flash[:notice] = "Menu Item Successfylly Deleted"
    redirect_to(:action => 'list')
  end

	
end
