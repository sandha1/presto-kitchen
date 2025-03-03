class AppliancesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @appliances = Appliance.all
  end
  
  def show
    @appliance = Appliance.find(params[:id])
  end
end
