class AdminsController < ApplicationController

  def new
   @admin = Admin.new
 end

 def create
   @admin = Admin.new admin_params
   if @admin.save
     session[:admin_id] = @admin.id
     redirect_to root_path, notice: "Logged In!"
  else
     render :new
   end
 end

 private

 def admin_params
   params.require(:admin).permit(:first_name, :last_name, :email,
   :password, :password_confirmation)
 end
end
