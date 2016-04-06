json.offers @offers do |offer|
  json.partial! offer
  json.lender do
    json.partial!(offer.lender)
  end
end
