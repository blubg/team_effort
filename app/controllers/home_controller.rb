class HomeController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :resources]

  def show
  end

  def index
  end

  def resources
  end




  def edit
  end

  def update
  end

end
