package tw.group5.marketSeller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;


import tw.group5.marketSeller.model.MarketOrder;

public class MarketCart {
   private Map<Integer, MarketOrder> cart = new LinkedHashMap<>();
   public MarketCart() {
	   
   }
// 獲得購買商品內容
	public Map<Integer, MarketOrder>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
// 加入購物車
    public void addToCart(int productId, MarketOrder mi) {
		if (mi.getQuantity() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(productId) == null ) {
		    cart.put(productId, mi);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			MarketOrder mib = cart.get(productId);
			// 加購的數量：oi.getQty()
			// 原有的數量：oib.getQty()			
			mib.setQuantity(mi.getQuantity() + mib.getQuantity());
		}   	
    }
    //========
 // 修改數量
 	public boolean modifyQty(int productId, int  newQty) {
 		if ( cart.get(productId) != null ) {
 		   MarketOrder  mi = cart.get(productId);
 		   mi.setQuantity(newQty);
 	       //cart.put(bookID, oi);
 	       return true;
 		} else {
 		   return false;
 		}
 	}
 	
 // 刪除某項商品
 	public int deleteOrder(int productId) {
 		if ( cart.get(productId) != null ) {
 	       cart.remove(productId);  // Map介面的remove()方法
 	       return 1;
 		} else {
 		   return 0;
 		}
 	}
 	
 // 清空購物車
 	public void deleteAllOrders() {
 		cart.clear();
 	}
 	
 // 獲得購物車內商品種類數量
 	public int getItemNumber(){   // ShoppingCart.itemNumber
 		return cart.size();
 	}
 	
 //計算購物車內所有商品的小計(每項商品的單價*數量的總和)
 	public double getTotal(){
 		double subTotal = 0 ;
 		Set<Integer> set = cart.keySet();
 		for(int n : set){
 			int price    = cart.get(n).getPrice();		
 			int    qty      = cart.get(n).getQuantity();
 			subTotal +=  price * qty;
 		}
 		return subTotal;
 	}

 //計算購物車內所有商品的合計金額(每項商品的單價*折扣*數量的總和)
 	public double getSubtotal(){
 		double subTotal = 0 ;
 		Set<Integer> set = cart.keySet();
 		for(int n : set){
 			int price    = cart.get(n).getPrice();
 			int    qty      = cart.get(n).getQuantity();
 			subTotal +=  price *  qty;
 		}
 		return subTotal;
 	}
 	public void listCart() {
 		Set<Integer> set = cart.keySet();
 		for(Integer k : set){
 			System.out.printf("BookID=%3d,  Qty=%3d,  price=%5.2f,  discount=%6.2f\n" , k , cart.get(k).getQuantity(), cart.get(k).getPrice());
 		}
 		System.out.println("------------------");
 	}
 }