class ExperiencePacksController < ApplicationController
  before_action :authenticate_user!
  def index
    @experience_packs = ExperiencePack.all
  end

  def new
    @experience_pack = ExperiencePack.new
  end

  def create
    @experience_pack = ExperiencePack.new(experience_pack_params)
    if @experience_pack.save
      redirect_to experience_packs_path
    else
      render :new
    end
  end

  def edit
    @experience_pack = ExperiencePack.find(params[:id])
  end

  def update
    @experience_pack = ExperiencePack.find(params[:id])
    if @experience_pack.update(experience_pack_params)
      redirect_to experience_packs_path
    else
      render :edit
    end
  end

  def destroy
    @experience_pack = ExperiencePack.find(params[:id])
    @experience_pack.destroy
    redirect_to experience_packs_path
  end

  private
    def experience_pack_params
      params.require(:experience_pack).permit(:name)
    end
end
