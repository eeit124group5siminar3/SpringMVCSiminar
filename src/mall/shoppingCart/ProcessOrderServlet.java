package mall.shoppingCart;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import mall.ShoppingCart;
import mall.productModel.OrderItem;
import mall.productModel.ProductOrderBean;
import mall.productModel.ProductOrderItemBean;
import mall.service.OrderService;
import member_SignUp.Member_Bean;


/**
 * Servlet implementation class ProcessOrderServlet
 */
@WebServlet("/ProcessOrderServlet")
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String finalDecision = request.getParameter("finalDecision");		
//		HttpSession session = request.getSession();
		HttpSession session = request.getSession(false);
		if (session == null) {   // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
			return;
		}
		Member_Bean mb = (Member_Bean) session.getAttribute("login_ok");
		if (mb == null) {
//			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
//			return;
			mb=(Member_Bean) session.getAttribute("login_guest");
		}
		
		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
			return;
		}
		// 如果使用者取消訂單
		if  (finalDecision.equals("CANCEL")){
			session.removeAttribute("ShoppingCart");
			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()));
			return;  			// 一定要記得 return 
		}
		String memberId = mb.getMember_no();
	// 取出會員代號
//		String memberId="aaa";
		double totalAmount = Math.round(sc.getSubtotal() * 1.05);  	// 計算訂單總金額 
		String shippingAddress = request.getParameter("ShippingAddress");// 出貨地址
		String tel =request.getParameter("tel");
		String bNO = request.getParameter("BNO");					// 發票的統一編號  
		String invoiceTitle = request.getParameter("InvoiceTitle");	// 發票的抬頭
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		ProductOrderBean ob = new ProductOrderBean(memberId,invoiceTitle,shippingAddress,tel,bNO,totalAmount, today,null);
		
		// 新建一個存放訂單明細的Set物件: items		
		Set<ProductOrderItemBean> items = new HashSet<ProductOrderItemBean>();
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		// 然後存入items。
		Map<Integer, OrderItem> cart = sc.getContent();
		// 呼叫keySet()取出cart內所有的 key，由於Map內的Key不會重複，因此keySet()方法的傳回值為
		// Set物件
		Set<Integer> set = cart.keySet();
		// 使用for敘述將set內所有的元素(這些元素都是Map物件內的Key)逐一取出，然後經由Map物件的
		// get方法取出Key所對應的value物件。這些value物件就是客戶購買的商品。
		for (Integer k : set) {
			OrderItem oi = cart.get(k);   // 經由Map物件的 get方法取出Key所對應的value物件
			String description = oi.getProduct()+" "+oi.getContent()+oi.getUnit();
			// 由於表格的Primary Key為自動遞增，為了配合Hibernate，在此主鍵設定為null
			// (Hibernate規定：自動遞增的主鍵，其對應之物件的欄位必須是null)，絕對不可以是零。
			ProductOrderItemBean oib = new ProductOrderItemBean(0, oi.getProductId(),oi.getProducterId(), description, oi.getQty(), 
										oi.getPrice(), oi.getDiscount());
			items.add(oib);
		}
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		ob.setItems(items);  
		try {
			OrderService orderService = new OrderService();
			orderService.persistOrder(ob);
			session.removeAttribute("ShoppingCart");
			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()+"/mall/ThanksForOrdering.jsp"));
			return;
		} catch(RuntimeException ex){
			String message = ex.getMessage();
			String shortMsg = "" ;   
			shortMsg =  message.substring(message.indexOf(":") + 1);
			System.out.println(shortMsg);
			session.setAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg  + "，請調正訂單內容" );
			//System.out.println("處理訂單時發生異常: " + message);
			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()+"/mall/ProductShowCart.jsp"));
			return;
		}
	}

}
