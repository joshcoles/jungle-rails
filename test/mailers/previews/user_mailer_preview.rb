class UserMailerPreview < ActionMailer::Preview
  def order_email
    UserMailer.order_email(User.first, Order.first)
  end
end