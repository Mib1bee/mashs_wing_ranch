class ViewMenuController < ApplicationController
  
  layout 'secondary'

  def index
  	@chicken = Menu.chicken.order("menus.id ASC")
    @burgers = Menu.burgers.order("menus.id ASC")
    @hotdogs = Menu.hotdogs.order("menus.id ASC")
    @subs = Menu.gsubs.order("menus.id ASC")
    @wraps_salads = Menu.wraps.order("menus.id ASC")
    @sizzlers = Menu.sizzlers.order("menus.id ASC")
    @sides = Menu.sides.order("menus.id ASC")
  end


end
