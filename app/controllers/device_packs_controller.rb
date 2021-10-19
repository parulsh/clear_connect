class DevicePacksController < ApplicationController
  before_action :authenticate_user!
  def index
    @device_packs = DevicePack.all
  end

  def new
    @device_pack = DevicePack.new
  end

  def create
    @device_pack = DevicePack.new(device_pack_params)
    if @device_pack.save
      redirect_to device_packs_path
    else
      render :new
    end
  end

  def edit
    @device_pack = DevicePack.find(params[:id])
  end

  def update
    @device_pack = DevicePack.find(params[:id])
    if @device_pack.update(device_pack_params)
      redirect_to device_packs_path
    else
      render :edit
    end
  end

  def destroy
    @device_pack = DevicePack.find(params[:id])
    @device_pack.destroy
    redirect_to device_packs_path
  end

  private
    def device_pack_params
      params.require(:device_pack).permit(:name)
    end
end
