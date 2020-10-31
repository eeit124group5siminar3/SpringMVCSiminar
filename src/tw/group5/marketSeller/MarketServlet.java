package tw.group5.marketSeller;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import tw.group5.mall.model.ProductBean;

/**
 * Servlet implementation class MarketServlet
 */

public class MarketServlet implements Serializable {
	MarketSellerDAO dao;
	
	public MarketServlet() {
		this.dao=new MarketSellerDAO();
	}
	
	public int saveProduct(MarketSellerBean bean) {
		return dao.saveProduct(bean);
	}
	public MarketSellerBean getProduct(String productId) {

		return dao.selectId(productId);
	}
}