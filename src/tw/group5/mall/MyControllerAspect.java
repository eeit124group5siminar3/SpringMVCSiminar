package tw.group5.mall;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;



import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.mall.model.ProductBean;
import tw.group5.mall.service.ProductService;
@Transactional
@Component
@Aspect
public class MyControllerAspect {
	@Autowired
	private ProductService service;
	
	@Pointcut(value="execution(* tw.group5.mall.controller.MallShoppingController.showMallContent(..))") 
	public void pointcutPageProduct() {}  
	@Pointcut(value="execution(* tw.group5.mall.controller.MallShoppingController.showSingleProduct(..))") 
	public void pointcutSingleProduct() {}  
	@Pointcut(value="execution(* tw.group5.mall.controller.MallShoppingController.showWishListContent(..))") 
	public void pointcutWishList() {}  
	@Pointcut(value="execution(* tw.group5.mall.controller.MallMaintainController.productUpdate(..))&& args(bean,..)") 
	public void pointcutProductUpdate(ProductBean bean) {}  
	@Pointcut(value="execution(* tw.group5.mall.controller.MallMaintainController.productInsert(..))&& args(bean,..)") 
	public void pointcutProductInsert(ProductBean bean) {}  
//	@Pointcut(value="execution(* tw.group5.mall.model.ProductBean.*(java.lang.Integer))&& args(input)") 
//	public void pointcutProductBeanInteger(Object input) {}  
	

	@Before(value = "pointcutPageProduct() || pointcutSingleProduct()||pointcutWishList()")
	public void changeExpiredProductStatus (JoinPoint joinPoint) {
		System.err.println("我是路人乙");
		List<ProductBean> list=service.getExpiredProduct();
		for(ProductBean bean:list) {
			bean.setStatus(2);
		}
	}
	
	@After(value = "pointcutProductInsert(bean) || pointcutProductUpdate(bean)	", argNames="bean")
	public void setExpiredDate(JoinPoint joinPoint, ProductBean bean) {
		Date addedDate=bean.getAddedDate();
		Integer shelfTime=bean.getShelfTime();
		Calendar calendar=Calendar.getInstance();
		if(addedDate!=null) {
		calendar.setTime(addedDate);
		calendar.add(Calendar.DATE, shelfTime);
		Date date=new Date(calendar.getTime().getTime());
		bean.setExpiredDate(date);	
		}
	}
	
//	@Before(value = "pointcutProductBeanInteger(input)", argNames="input")
//	public Integer catchNumberFormatException(JoinPoint joinPoint,Object input) {
//		System.err.println(123);
//		Integer numOfpropoty=null;
//		try {
//			numOfpropoty=(Integer)input;
//		}catch(NumberFormatException e) {
//			e.printStackTrace();
//			numOfpropoty=null;
//		}
//		return numOfpropoty;
//	}
}
