def consolidate_cart(cart)
  consolCart={}
  cart.each do |product|
    product.each do |productName, details|
      if consolCart[productName] == nil 
        consolCart[productName]= details
        consolCart[productName][:count]=1 
      else 
      consolCart[productName][:count]+= 1 
    end 
  end
end
consolCart
end 

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.key?(coupon[:item])
      couponCount = 0
      until coupon[:num] > cart[coupon[:item]][:count]
        cart[coupon[:item]][:count] -= coupon[:num]
        cart["#{coupon[:item]} W/COUPON"] = {price: coupon[:cost], clearance: cart[coupon[:item]][:clearance], count: couponCount += 1}
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |product, details|
      if details[:clearance] == true 
        details[:price]= (details[:price]*0.80).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolCartconsolidate_cart(cart)
  coupcart=apply_coupons(consolCart)
  finalCart=apply_clearance(coupcart)
  cartTotal=0 
  finalCart.each do |product, detail|
    
end
