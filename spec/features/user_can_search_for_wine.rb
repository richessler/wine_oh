require 'spec_helper'

describe 'User can search for a wine' do
  before :each do
    visit root_path
    click_link('Search')
  end
  it "includes the wines 'La Rioja Alta Vina Ardanza Rioja Riserva' & 'La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial' as results when searching for 'Vina Ardanza'" do
    fill_in 'Search for:', with: 'Vina Ardanza'
    select '2', :from => 'Limit Search'
    click_button('Search')
    expect(page).to have_content("La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial" && "La Rioja Alta Vina Ardanza Rioja Riserva")
  end

  it "returns with only 'La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial' when searching for 'Vina Ardanza'" do
    fill_in 'Search for:', with: 'Vina Ardanza'
    select '1', :from => 'Limit Search'
    click_button('Search')
    expect(page).to have_content 'La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial'
  end

  it "can search and specify by color" do
    fill_in 'Search for:', with: 'barefoot'
    select '1', :from => 'Limit Search'
    select 'white', :from => 'Color'
    click_button('Search')
    expect(page).to have_content 'Barefoot Cellars Chardonnay Blend Sonoma Valley Bubbly'
  end

  it "can search by max price" do
    fill_in 'Search for:', with: 'barefoot'
    select '25', :from => 'Limit Search'
    select 'red', :from => 'Color'
    fill_in 'Max Price:', with: '15'
    click_button('Search')
    expect(page).to have_content('Barefoot Malbec' && 'Barefoot Pinot Noir')
  end
end


# region, grape varietal, price, country, region, and point of sale.
