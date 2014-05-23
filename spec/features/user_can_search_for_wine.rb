require 'spec_helper'

describe 'User can search for a wine' do
  before (:each) do
    visit root_path
    click_link('Search')
  end
  it "includes the wines 'La Rioja Alta Vina Ardanza Rioja Riserva' & 'La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial' as results when searching for 'Vina Ardanza'" do
    fill_in 'Search for:', with: 'Vina Ardanza'
    click_button('Search')
    expect(page).to have_content "La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial" && "La Rioja Alta Vina Ardanza Rioja Riserva"
  end

  it "returns with only 'La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial' when searching for 'Vina Ardanza'" do
    fill_in 'Search for:', with: 'Vina Ardanza'
    fill_in 'Limit Search to:', with: '1'
    click_button('Search')
    expect(page).to have_content 'La Rioja Alta Tempranillo Blend Rioja Viña Ardanza Reserva Especial'
  end

  it "can search and specify by color" do
    fill_in 'Search for:', with: 'Vina Ardanza'
    fill_in 'Limit Search to:', with: '1'
    fill_in 'Color', with 'red'
    click_button('Search')
    click
  end
end


name, color, region, grape varietal, price, country, region, and point of sale.
