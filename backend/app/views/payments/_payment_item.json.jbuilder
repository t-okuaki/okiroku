json.id payment_item.id
json.name payment_item.name
json.price payment_item.price
json.count payment_item.count
json.space_name payment_item.space_name

json.payment_item_works payment_item.payment_item_works do |payment_item_work|
  json.partial! 'payments/payment_item_work', payment_item_work:
end
