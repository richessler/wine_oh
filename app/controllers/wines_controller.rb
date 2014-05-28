
class WinesController < ApplicationController

  def index
    @wines = Wine.all
  end


  #
  # for self search page
  #
  #
  # def self.search(query)
  #   if query
  #     where('name ILIKE ?', "%#{query}%")
  #   else
  #     all
  #   end
  # end

  def show
    @stores = get_store_info(params[:z])
    @zip = params[:z]
  end

  def selection
    @wine = get_wine_info(params[:id])
  end

  def results
    @wines = get_wine_url(params[:q], params[:country], params[:color], params[:n], params[:xp], params[:mp], params[:sort])

    if @wines.blank?
      flash[:error] = 'No wines exist for your search parameters.'
      redirect_to search_path
    else
    end
  end

  private

  def get_wine_url(wine='wine', country='USA', color='', limit = 100,xp='', mp='', sort='')
    wine = wine.gsub(" ", "+") + "+" + country.gsub(" ", "+")
    if color == ''
      response = HTTParty.get("http://api.snooth.com/wines/?akey=#{SNOOTH_API}&t=wines&n=#{limit}&q=#{wine}&mp=#{mp}&xp=#{xp}&s=#{sort}")
    else
      response = HTTParty.get("http://api.snooth.com/wines/?akey=#{SNOOTH_API}&t=wines&n=#{limit}&q=#{wine}&color=#{color}&mp=#{mp}&xp=#{xp}&s=#{sort}")
    end
    response_hash = JSON(response)
    response_hash["wines"]
  end

  def get_wine_info(name)
    name = name.gsub(" ", "+")
    response = HTTParty.get("http://api.snooth.com/wine/?akey=#{SNOOTH_API}&photos=1&food=1&id=#{name}")
    response_hash = JSON(response)
    response_hash["wines"]
  end

  def get_store_info(zip)
    response = HTTParty.get("http://api.snooth.com/stores/?akey=#{SNOOTH_API}&c=US&z=#{zip}")
    response_hash = JSON(response)
    response_hash["stores"]
  end
end
