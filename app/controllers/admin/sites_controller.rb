class Admin::SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to admins_site_path(@site)
    else
      render :new
    end
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to admins_sites_path(@site)
    else
      render :edit
    end
  end

  private

  def site_params
    params.require(:site).permit(:admin_id, :site_name, :site_address, :introduction, :day, :site_status)
  end

end