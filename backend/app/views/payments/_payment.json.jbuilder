json.id payment.id
json.price payment.price
json.created_at payment.created_at.iso8601

json.payment_items payment.payment_items do |payment_item|
  json.partial! 'payments/payment_item', payment_item:
end
