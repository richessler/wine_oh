class WinesController < ApplicationController

  def index
    @wines = Wine.all
  end

  def show
  end

  def selection
    @wines = get_wine_info(params[:q])
  end

  def results
    @wines = get_wine_url(params[:q], params[:color], params[:n], params[:xp], params[:mp])
  end

  private

  def get_wine_url(wine, color='', limit = 100,xp='', mp='')
    wine = wine.gsub(" ", "+")
    if color == ''
      response = HTTParty.get("http://api.snooth.com/wines/?akey=#{SNOOTH_API}&n=#{limit}&q=#{wine}&mp=#{mp}&xp=#{xp}")
    else
      response = HTTParty.get("http://api.snooth.com/wines/?akey=#{SNOOTH_API}&n=#{limit}&q=#{wine}&color=#{color}&mp=#{mp}&xp=#{xp}")
    end
    response_hash = JSON(response)
    response_hash["wines"]
  end

  # def get_wine_info(name, limit = 100)
  #   name = name.gsub(" ", "+")
  #   response = HTTParty.get("http://api.snooth.com/wines/?akey=tniir1xqtueyk59ei1q35o7rr00vp4mrmlnubuy1qi1usbwm&n=#{limit}&q=#{name}")
  #   response_hash = JSON(response)
  #   response_hash["wines"]
  # end
end
