module ApplicationHelper

  def sort_options
    [
      ["Increasing Price", "price+asc"],
      ["Decreasing Price", "price+desc"],
      ["Quality Price Ratio", "qpr"],
      ["Old to Young Vintage", "vintage+asc"],
      ["Young to Old Vintage", "vintage+desc"]
    ]
  end

  def supported_countries
  [
    ["United States", "USA"],
    ["Argentina", "Argentina"],
    ["Australia", "Australia"],
    ["Austria", "Austria"],
    ["Belgium", "Belgium"],
    ["Belize", "Belize"],
    ["Brazil", "Brazil"],
    ["Canada", "Canada"],
    ["China", "China"],
    ["Cyprus", "Cyprus"],
    ["Czech Republic", "Czech Republic"],
    ["Denmark", "Denmark"],
    ["Estonia", "Estonia"],
    ["France", "France"],
    ["Germany", "Germany"],
    ["Great Britain", "Great Britain"],
    ["Hong Kong", "Hong Kong"],
    ["Hungary", "Hungary"],
    ["Ireland", "Ireland"],
    ["Italy", "Italy"],
    ["Japan", "Japan"],
    ["Luxembourg", "Luxembourg"],
    ["Malaysia", "Malaysia"],
    ["Malta", "Malta"],
    ["Mauritius", "Mauritius"],
    ["Netherlands", "Netherlands"],
    ["New Zealand", "New Zealand"],
    ["Norway", "Norway"],
    ["Philippines", "Philippines"],
    ["Poland", "Poland"],
    ["Portugal", "Portugal"],
    ["Puerto Rico", "Puerto Rico"],
    ["Romania", "Romania"],
    ["Russia", "Russia"],
    ["Singapore", "Singapore"],
    ["South Africa", "South Africa"],
    ["Spain", "Spain"],
    ["Sweden", "Sweden"],
    ["Switzerland", "Switzerland"],
    ["United Kingdom", "United Kingdom"]
  ]
end
end
