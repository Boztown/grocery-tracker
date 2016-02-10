json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :shopping_date
  json.url receipt_url(receipt, format: :json)
end
