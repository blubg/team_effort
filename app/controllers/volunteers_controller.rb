class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin!, except: [:index, :show, :new, :create]


  def index
    @volunteers = Volunteer.order(:first_name)
    if params[:search]
      @volunteers = Volunteer.search(params[:search])
    else
      @volunteers
    end
  end


  def show
  end


  def new
    @volunteer = Volunteer.new
  end


  def edit
    @volunteer = Volunteer.find params[:id]
  end


  def create
    @volunteer = Volunteer.new(volunteer_params)
      if @volunteer.save
         redirect_to volunteer_path(@volunteer)
      else
        render :index
      end
  end


  def update

      if @volunteer.update(volunteer_params)
        redirect_to volunteers_path
      else
        render :edit
      end

  end

  def destroy
    @volunteer.destroy
     redirect_back(fallback_location: volunteers_path)
  end

  private

    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end


    def volunteer_params
      params.require(:volunteer).permit(:first_name, :last_name, :email, :phone_number, :status)
    end
end
