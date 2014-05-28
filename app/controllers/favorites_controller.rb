class FavoritesController < ApplicationController
  before_action :find_user

  def create
    wine = Wine.find_or_initialize_by(:snooth_id => params["snooth_id"]) do |wine|
      wine.name       = params["name"]
      wine.snooth_id  = params["snooth_id"]
      wine.region     = params["region"]
      wine.image_url  = params["image_url"]
    end

    if wine.valid? && !@user.wines.exists?(wine)
        @user.wines << wine
      end
      redirect_to user_path(current_user)

  end

  def destroy

  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def favorite_params
    params.require(:favorite).permit(
      :wine_id,
      :user_id,
      :rating
    )
  end

  def wine_params
    params.require(:wine).permit(
      :name,
      :snooth_id,
      :region,
      :image_url
      )
  end
end
