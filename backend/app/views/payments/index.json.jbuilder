json.array! @payments do |payment|
  json.partial! 'payments/payment', payment:
end
