class AboutController < ApplicationController

  def index
    @about = About.last
  end

  def new
    @about = About.new
  end


  def create
    @about = About.new about_params
     if @about.save
       redirect_to about_index_path
     else
       render :new
     end
  end

  def edit
    @about = About.find params[:id]
  end

  def update
    @about = About.find params[:id]
    if @about.update(about_params)
      redirect_to about_index_path
    else
      render :edit
    end
  end

  def about_params
    params.require(:about).permit(:title, :body)
  end
end
