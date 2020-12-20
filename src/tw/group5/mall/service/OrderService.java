package tw.group5.mall.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.mall.dao.OrderDAO;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProductOrderBean;
import tw.group5.mall.model.ProductOrderItemBean;
import tw.group5.mall.model.ProducterBean;

@Service
@Transactional
//@Scope(value = "session")
public class OrderService {
//	private Session session;
	@Autowired
	private OrderDAO odao;

//	public OrderService(Session session) {
//		this.odao = new OrderDAO(session);
//	}

	// 這是一個交易
	public void persistOrder(ProductOrderBean ob) {
//		
		checkStock(ob);
//			
//			// 儲存訂單

		odao.insertOrder(ob);
	}

	public void checkStock(ProductOrderBean ob) {
		Set<ProductOrderItemBean> items = ob.getItems();
		for (ProductOrderItemBean oib : items) {
			odao.updateProductStock(oib);
		}
	}

	public OrderDAO getOdao() {
		return odao;
	}

	public void setOdao(OrderDAO odao) {
		this.odao = odao;
	}

	public ProductOrderBean getOrder(int orderNo) {
		return odao.getOrder(orderNo);
	}

	public List<ProductOrderBean> getAllOrders() {
		return odao.getAllOrders();
	}

	public List<ProductOrderBean> getMemberOrders(int memberId) {
		return odao.getMemberOrders(memberId);
	}

	public void setPageNo(Integer pageNo) {
		odao.setPageNo(pageNo);
	}

	public int getTotalPages(Integer buyerId) {
		return odao.getTotalPages(buyerId);
	}

	public ProducterBean getProducterId(Integer producterId) {
		return odao.getProducterId(producterId);
	}

	public void setMaintainPageNo(Integer pageNo) {
		odao.setMaintainPageNo(pageNo);
	}

	public int getMaintainTotalPages(Integer producterId) {
		return odao.getMaintainTotalPages(producterId);
	}

	public List<ProductOrderItemBean> getMaintainOrders(Integer producterId) {
		return odao.getMaintainOrders(producterId);
	}

	public ProductOrderItemBean getOrderItem(Integer orderDetailId) {
		return odao.getOrderItem(orderDetailId);
	}

	public List<List> getOrderItemList(List<Integer> orderItemIds) {
		List<ProductOrderItemBean> itemBeans=odao.getOrderItemList(orderItemIds);
		List <List> list=new ArrayList<List>();
		List title=new ArrayList();
		title.add("訂單編號");
		title.add("收件人");
		title.add("連絡電話");
		title.add("地址");
		title.add("統一編號");
		title.add("產品");
		title.add("數量");
		title.add("下訂時間");
		title.add("期望送達時間");
		title.add("總金額");
		list.add(title);
		for(ProductOrderItemBean itemBean:itemBeans) {
			List beanList=new ArrayList();
			beanList.add(itemBean.getProductOrderBean().getOrderId());
			beanList.add(itemBean.getProductOrderBean().getBuyerName());
			beanList.add(itemBean.getProductOrderBean().getTel());
			beanList.add(itemBean.getProductOrderBean().getAddress());
			beanList.add(itemBean.getProductOrderBean().getbNo());
			beanList.add(itemBean.getDescription());
			beanList.add(itemBean.getAmount());
			beanList.add(itemBean.getProductOrderBean().getOrderDate());
			beanList.add(itemBean.getProductOrderBean().getShippingTimeWord());
			beanList.add(Math.round(itemBean.getUnitPrice()*itemBean.getDiscount()*itemBean.getAmount()));
			list.add(beanList);
		}
		return list;
	}
}
