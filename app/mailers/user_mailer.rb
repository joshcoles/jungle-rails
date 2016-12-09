class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url = "http://www.example.com"
    mail(to: "josh@joshcoles.com", subject: "Jungle Purchase, Order ID: #{@order.id}")
  end

end
