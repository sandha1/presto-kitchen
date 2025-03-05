class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_appliances
    @appliances = Appliance.where(user: current_user)
  end

  def my_
end
