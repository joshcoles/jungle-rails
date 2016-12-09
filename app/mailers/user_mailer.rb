class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url = "http://www.example.com"
    puts "order.email #{order.user.email.inspect}"
    mail(to: order.user.email, subject: "Jungle Purchase, Order ID: #{@order.id}")
  end

end
