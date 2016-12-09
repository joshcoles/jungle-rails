class UserMailerPreview < ActionMailer::Preview
  def order_email
    UserMailer.order_email(Order.first)
  end
end