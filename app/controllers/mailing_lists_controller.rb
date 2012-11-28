class MailingListsController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def index
  	list
  	render('list')
  end

  def list
  	@pagetitle = "Mailing List"
  	@mailing = MailingList.order("mailing_lists.id ASC")
  end

  def delete
    @mailing = MailingList.find(params[:id])
    @pagetitle = "Delete Mail"
    flash[:error] = "Are you sure you want to delete #{@mailing.email} from the mailing list?"
  end
  
  def destroy
    MailingList.find(params[:id]).destroy
    flash[:notice] = "Mail Successfylly Deleted"
    redirect_to(:action => 'list')
  end

end
