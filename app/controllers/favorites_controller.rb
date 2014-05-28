class FavoritesController < ApplicationController
  before_action :find_user

  def create
    @user.favorites.create(favorite_params)

    if current_user.to_favorite(@wine)
      redirect_to user_wines_path(current_user)
    else
      redirect_to search_path
    end
  end

  def destroy

  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def favorite_params
    params.require(:favorite).permit(
      :name,
      :code,
      :image_url,
      :rating,
      :review
    )
  end
end
