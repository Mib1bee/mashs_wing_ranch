class AccessController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]


  def index
  	admin_index
	render('admin_index')
	@pagetitle = "Admin Area"
  end

  def login
  	flash[:notice] = "Please Log In To Acess The Administration Area"
  	@pagetitle = "Admin Login"
  	@formtitle = "Login Form"
  end

  def admin_index
  	@pagetitle = "Admin Area"
  	flash[:notice] = "Thank You For Logging In #{session[:first_name]}"
  end

  def attempt_login
		authorised_user = AdminUser.authenticate(params[:username], params[:password])
		if authorised_user
			session[:user_id] = authorised_user.id
			session[:username] = authorised_user.username
			session[:first_name] = authorised_user.first_name
			session[:last_name] = authorised_user.last_name
			flash[:notice] = "You are now logged in"
			redirect_to(:action => 'admin_index')
		else
			flash[:error] = "Error Logging In. Please Check Your Username/Passsword"
			redirect_to(:action => 'login')
		end
	end

	def logout
		session[:user_id] = nil
		session[:username] = nil
		session[:first_name] = nil
		session[:last_name] = nil
		flash[:notice] = "You have been logged out"
		redirect_to(:controller => 'main')
	end

end
