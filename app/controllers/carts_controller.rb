class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    cart = Cart.find(params[:id])
    cart_name = cart.title
    if cart.destroy
      notice_message = "#{cart_name}s deleted successfully."
      redirect_to carts_path, notice: notice_message
    end
  end

  def increase_quantity
    @item = Item.find(params[:item_id])
    new_quantity = @item.quantity + 1
    if @item.update(quantity: new_quantity)
      @total = calculate_total(@item)
    end
  end

  def decrease_quantity
    @item = Item.find(params[:item_id])
    new_quantity = @item.quantity - 1
    if @item.update(quantity: new_quantity)
      @total = calculate_total(@item)
    end
  end

  def remove_item
    item = Item.find(params[:item_id])
    @item_id = params[:item_id]
    cart = item.cart
    if item.delete
      @total = total_amount(cart)
    end
  end

  private

  def calculate_total(item)
    cart = item.cart
    total = 0
    cart.items.each do |i|
      total = total + (i.quantity * i.price)
    end
    total
  end

  def total_amount(cart)
    total = 0
    cart.items.each do |item|
      total = total + (item.quantity * item.price)
    end
    total
  end
end
