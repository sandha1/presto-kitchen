class AppliancesController < ApplicationController

  def new
    @appliance = Appliances.new
  end

  def create
    @appliance = Appliance.new(appliance_params)
    if @appliance.save
      redirect_to appliance_path(@appliance)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def appliance_params
    params.require(:appliance).permit(:name, :description, :price)
  end

end
