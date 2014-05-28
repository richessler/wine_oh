  require 'spec_helper'

describe 'User can search for a wine' do
  before :each do
    visit root_path
    click_link('Search')
    fill_in 'Search for:', with: 'Barefoot'
    select 'United States', :from => "Country"
    select 'red', :from => 'Color:'
  end

  it "includes wines based off name search" do
    click_button('Search')
    expect(page).to have_content("Barefoot Cellars Cab")
  end

  it "can limit search results" do
    select '1', :from => 'Limit Search'
    click_button('Search')
    expect(page).to have_content "Barefoot Cellars Zinfandel California"
  end

  it "can search and specify by color" do
    select 'white', :from => 'Color'
    click_button('Search')
    expect(page).to have_content 'Barefoot Cellars Chardonnay'
  end

  it "can search by max price" do
    fill_in 'Search for:', with: 'barefoot'
    fill_in 'Max Price:', with: '100'
    click_button('Search')
    expect(page).to have_content('Barefoot Cellars Cabernet Sauvignon California')
  end

  it "can search by range" do
    fill_in 'Min Price:', with: '10'
    fill_in 'Max Price:', with: ''
    click_button('Search')
    expect(page).to have_content('Barefoot Cellars Cabernet Sauvignon California' && '21.78' && 'Barefoot Cellars Merlot California'&& '21.77')
  end

  it "can sort least to greatest price" do
    fill_in 'Min Price:', with: ''
    fill_in 'Max Price:', with: '10000'
    select 'Increasing Price', :from => 'Sort by:'
    click_button('Search')
    page.text.should match(/1.99.*2.49/)
  end

  it "can sort greatest to least price" do
    fill_in 'Min Price:', with: ''
    fill_in 'Max Price:', with: '10000'
    select 'Decreasing Price', :from => 'Sort by:'
    click_button('Search')
    page.text.should match(/59.88.*21.78/)
  end

  it "can sort Young to Old vintage" do
    select 'Young to Old Vintage', :from => 'Sort by:'
    click_button('Search')
    page.text.should match(/2012.*2009.*2006/)
  end

  it "can sort old to young vintage" do
    select 'Old to Young Vintage', :from => 'Sort by:'
    click_button('Search')
    page.text.should match(/1975.*1997.*2001/)
  end

  #
  #
  #TO DO LATER
  #
  #
  #
  # it "will return only one result for multiple names" do
  #   fill_in 'Search for:', with: 'vina ardanza'
  #   select '10', :from => 'Limit Search'
  #   select 'red', :from => 'Color'
  #   fill_in 'Min Price:', with: ''
  #   fill_in 'Max Price:', with: ''
  #   click_button('Search')
  #   expect(page).to have_content("La Rioja Alta Vina Ardanza Rioja Riserva", :count => 1)
  # end
  #
  #
  #
  #

  # TEST FOR QPR
end

