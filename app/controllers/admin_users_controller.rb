class AdminUsersController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in

  def index
  	list
  	render ('list')
  end

  def list
    @pagetitle = "Admin Users List"
  	@admin_users = AdminUser.order("admin_users.id ASC")
    @item = "Admin User"
  end

  def new
  	@admin_user = AdminUser.new
    @pagetitle = "Create New Admin User"
  end

  def create
	@admin_user = AdminUser.new(params[:admin_user])
	if @admin_user.save
		flash[:notice] = 'New Admin User Created'
		redirect_to(:action => 'list')
	else
    flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
		render("new")
	end
  end

  def edit
  	@admin_user = AdminUser.find(params[:id])
    @pagetitle = "Edit User - #{@admin_user.first_name} #{@admin_user.last_name}"
  end

  def update
	@admin_user = AdminUser.find(params[:id])
  @pagetitle = "Edit User - #{@admin_user.first_name} #{@admin_user.last_name}"
  	if @admin_user.update_attributes(params[:admin_user])
  		flash[:notice] = "#{@admin_user.first_name} #{@admin_user.last_name} Updated Successfully"
  		redirect_to(:action => 'list')
  	else
      flash[:error] = "There Was An Error In Saving The Form. Please Check The Causes Below"
  		render("edit")
  	end
  end

  def delete
	@admin_user = AdminUser.find(params[:id])
  @pagetitle = "Delete #{@admin_user.first_name} #{@admin_user.last_name} as an Admin User"
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @first_name = @admin_user.first_name
    @surname = @admin_user.last_name
  	@admin_user.destroy
  	flash[:notice] = "#{@first_name} #{@surname} Has Been Deleted As An Admin User"
  	redirect_to(:action => 'list')
    @first_name = nil
    @surname = nil
  end

end

