class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 感谢您完成本次下单，以下是您此次的购物明细 #{order.token}")
  end

  def apply_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@gmail.com", subject: "[JDstore] 用户#{order.user.email}申请取消订单 #{order.token}")
  end

  def notify_ship(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 您的订单#{order.token}已经发货")
  end

  def notify_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] 您的订单 #{order.token}已取消")
  end


end
