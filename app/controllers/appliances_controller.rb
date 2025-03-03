class AppliancesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @appliance = Appliance.find(params[:id])
  end
end
