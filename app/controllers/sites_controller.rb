class SitesController < ApplicationController
  def index
    @admin = current_admin
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    @admin = @site.admin
    @site = Site.all
  end

  private

  def site_params
    params.require(:site).permit(:site_name, :site_address, :introduction, :day, :site_status)
  end

  def admin_params
    params.require(:admin).permit(:name, :postal_code, :address, :phone_number)
  end
end
