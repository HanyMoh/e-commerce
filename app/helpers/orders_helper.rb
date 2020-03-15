module OrdersHelper
  def format_payment_type(num)
    if num.equal? 1
      Order::PAYMENT_TYPES.values.first
    elsif num.equal? 2
      Order::PAYMENT_TYPES.values.second
    else
      Order::PAYMENT_TYPES.values.third
    end
  end

  def format_cancelation_reasons(reasons)
    results = []
    results << "User doesn't provide reasons for cancelation" if reasons.empty?
    reasons.each do |reason|
      if reason == '1'
        results << 'I found a better place to buy.'
      elsif reason == '2'
        results << 'Delivery late.'
      elsif reason == '3'
        results << 'Your quality is bad.'
      elsif reason == '4'
        results << 'The prices are high compared to other websites.'
      elsif reason == '5'
        results << 'Other'
      end
    end
    results
  end
end
