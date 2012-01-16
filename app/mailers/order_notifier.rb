class OrderNotifier < ActionMailer::Base
  default from: "admin@sexmatic.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Sexmatice Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: "Pragmatic Store Order Shipped"
  end
  
  
  def error(description)
    @description = description
    mail to: "ttboy86@gmail.com", subject: "Application made a boo boo"
  end
end
