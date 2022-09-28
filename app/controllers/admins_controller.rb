class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :correct_admin, only: [:edit, :update]


  def show
    @admins = Admin.all
    @admin = Admin.find(params[:id])
    @sites = Site.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to admin_path(@admin.id)
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :postal_code, :address, :phone_number, :email)
  end

  def correct_admin
    @admin = Admin.find(params[:id])
    if current_admin != @admin
      redirect_to admin_path(current_admin.id)
    end
  end

  def update_params
    params.require(:admin).permit(:name, :postal_code, :address, :phone_number, :email)
  end
  
end