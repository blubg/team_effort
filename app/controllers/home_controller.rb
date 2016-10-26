class HomeController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :resources]

  def show
  end

  def index
  end

  def resources
  end


//to edit/update the resources, admin only

  def edit
  end

  def update
  end

end
