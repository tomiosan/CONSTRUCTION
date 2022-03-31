class AdminsController < ApplicationController
  def index
    @admin = current_admin
    @admins = Admin.all
    @sites = Site.all
    @site = Site.new
  end
  
  def show
    @admin = Admin.find(params[:id])
    @site = Site.new
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to admin_path
    end
  end
  
  private
  
  def admin_params
    params.require(:admin).permit(:name, :postal_code, :address, :phone_number)
  end
  
end
