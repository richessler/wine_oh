class WinesController < ApplicationController

  def index
    @wines = Wine.all
  end

  def show
  end

  def selection
    @wine = get_wine_info(params[:id])
  end

  def results
    @wines = get_wine_url(params[:q], params[:color], params[:n], params[:xp], params[:mp], params[:country], params[:sort])
    if @wines.blank?
      flash[:error] = 'No wines exist for your search parameters.'
      redirect_to search_path
    else
    end
  end

  private

  def get_wine_url(wine, color='', limit = 100,xp='', mp='', country, sort)
    wine = wine.gsub(" ", "+")
    if color == ''
      response = HTTParty.get("http://api.snooth.com/wines/?akey=#{SNOOTH_API}&t=wine&n=#{limit}&q=#{wine}&mp=#{mp}&xp=#{xp}&c=#{country}&s=#{sort}")
    else
      response = HTTParty.get("http://api.snooth.com/wines/?akey=#{SNOOTH_API}&n=#{limit}&q=#{wine}&color=#{color}&mp=#{mp}&xp=#{xp}&c=#{country}&s=#{sort}")
    end
    response_hash = JSON(response)
    response_hash["wines"]
  end

  def get_wine_info(name)
    name = name.gsub(" ", "+")
    response = HTTParty.get("http://api.snooth.com/wine/?akey=tniir1xqtueyk59ei1q35o7rr00vp4mrmlnubuy1qi1usbwm&food=1&id=#{name}")
    response_hash = JSON(response)
    response_hash["wines"]
  end
end
