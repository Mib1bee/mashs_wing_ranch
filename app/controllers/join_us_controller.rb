class JoinUsController < ApplicationController

	layout 'secondary'
	
  def index
  	@mailing_list = MailingList.new
  end

  def create
  	@mailing_list = MailingList.new(params[:mailing_list])
    # Save the object
    if @mailing_list.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Your Application Has Been Submitted. We Appreciate Your Interest In Our Business. Thank You!"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = "Oops! Looks Like You Didn't Fill Out The Form Correctly! Please Check The Labels Coloured Black"
      render('index')
   end
  end

end
