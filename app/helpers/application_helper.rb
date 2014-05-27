module ApplicationHelper

  def sort_options
    [
      ["Increasing Price", "price+asc"],
      ["Decreasing Price", "price+desc"],
      ["Quality Price Ratio", "qpr"],
      ["Increasing Vintage", "vintage+asc"],
      ["Decreasing Vintage", "vintage+desc"]
    ]
  end

  def supported_countries
  [
    ["United States" ,"US"],
    ["Argentina" ,"AR"],
    ["Australia" ,"AU"],
    ["Austria" ,"AT"],
    ["Belgium" ,"BE"],
    ["Belize" ,"BZ"],
    ["Brazil" ,"BR"],
    ["Canada" ,"CA"],
    ["China" ,"CN"],
    ["Cyprus" ,"CY"],
    ["Czech Republic" ,"CZ"],
    ["Denmark" ,"DK"],
    ["Estonia" ,"EE"],
    ["France" ,"FR"],
    ["Germany" ,"DE"],
    ["Great Britain" ,"GB"],
    ["Hong Kong" ,"HK"],
    ["Hungary" ,"HU"],
    ["Ireland" ,"IE"],
    ["Italy" ,"IT"],
    ["Japan" ,"JP"],
    ["Luxembourg" ,"LU"],
    ["Malaysia" ,"MY"],
    ["Malta" ,"MT"],
    ["Mauritius" ,"MU"],
    ["Netherlands" ,"NL"],
    ["New Zealand" ,"NZ"],
    ["Norway" ,"NO"],
    ["Philippines" ,"PH"],
    ["Poland" ,"PL"],
    ["Portugal" ,"PT"],
    ["Puerto Rico" ,"PR"],
    ["Romania" ,"RO"],
    ["Russia" ,"RU"],
    ["Singapore" ,"SG"],
    ["South Africa" ,"ZA"],
    ["Spain" ,"ES"],
    ["Sweden" ,"SE"],
    ["Switzerland" ,"CH"],
    ["United Kingdom" ,"UK"]
  ]
end
end
