class SitesController < ApplicationController

  skip_before_action :authenticate_admin!, only: [:index, :show]
  

  def index
    @admin = current_admin
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    @admin = @site.admin
    @sites = Site.all
  end

  def create
    @site = Site.new(site_params)
    @site.admin_id = current_admin.id
    @site.save
    if @site.update(site_params)
      redirect_to admin_site_path(@site.id)
    else
      @admin = current_admin
      @sites = Site.all
      render :index
    end
  end

  def update
    @site = Site.find(params[:id])
    @site.admin_id = current_admin.id
    if @site.update(site_params)
      redirect_to admin_sites_path(@site.id)
    else
      render "edit"
    end
  end

  def destroy
    @site = Site.find(params[:id])
    if @site.destroy
      redirect_to admin_sites_path
    end
  end

  private

  def site_params
    params.require(:site).permit(:site_name, :site_address, :introduction, :day, :site_status)
  end

  def admin_params
    params.require(:admin).permit(:name, :postal_code, :address, :phone_number, :email)
  end

  def correct_admin
    @site = Site.find(params[:id])
    @admin = @site.admin
    if current_admin != @admin
      redirect_to site_path
    end
  end

  def update_params
    params.require(:site).permit(:admin_id, :site_name, :site_address, :introduction, :day, :site_status)
  end
end
