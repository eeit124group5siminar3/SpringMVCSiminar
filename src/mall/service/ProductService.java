package mall.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import mall.dao.ProductDAO;
import mall.productModel.CategoryBean;
import mall.productModel.ProductBean;
import util.HibernateUtil;

public class ProductService implements Serializable {
//	private static final SessionFactory factory=HibernateUtil.getSessionFactory();
//	private static Session session=factory.getCurrentSession();
	private  Session session;
	ProductDAO dao;

	
	public ProductService(Session session) {
		this.dao = new ProductDAO(session);
	}

	

	public int getTotalPages() {
		return dao.getTotalPages();
	}
	public int getTotalPages(String producterId) {
		return dao.getTotalPages(producterId);
	}

	public List<ProductBean> getPageProducts() {
		return dao.getPageProducts();
	}
	public List<ProductBean> getPageProducts(String producterId) {
		return dao.getPageProducts(producterId);
	}

	public int getPageNo() {
		return dao.getPageNo();
	}

	public void setPageNo(int pageNo) {
		dao.setPageNo(pageNo);
	}

	public int getRecordsPerPage() {
		return dao.getRecordsPerPage();
	}

	public void setRecordsPerPage(int recordsPerPage) {
		dao.setRecordsPerPage(recordsPerPage);
	}

	public long getRecordCounts() {
		return dao.getRecordCounts();
	}

	public ProductBean getProduct(int productId) {

		return dao.getProduct(productId);
	}

	public int updateProduct(ProductBean bean, long sizeInBytes) {
		return dao.updateProduct(bean, sizeInBytes);
	}

	public int deleteProduct(int no) {
		return dao.deleteProduct(no);
	}

	public int saveProduct(ProductBean bean) {
		return dao.saveProduct(bean);
	}

	public List<CategoryBean> getCategory() {
		return dao.getCategory();
	}

	public void setSelected(int category) {
		dao.setSelected(category);
	}

//	public String getCategoryTag() {
//		return dao.getCategoryTag();
//	}
	public CategoryBean getCategoryById() {
		return dao.getCategoryById();
	}
	public String getSelectTag() {
		return dao.getSelectTag();
	}
	public int getId() {
		return dao.getId();
	}

	public void setId(int id) {
		dao.setId(id);
	}
	public String getTagName() {
		return dao.getTagName();
	}

	public void setTagName(String tagName) {
		dao.setTagName(tagName);
	}
	public int getSelected() {
		return dao.getSelected();
	}

	public List<ProductBean> getPageProductsWithoutZero() {
		return dao.getPageProductsWithoutZero();
	}
	public List<ProductBean> getPageProductsWithoutZero(String searchString) {
		return dao.getPageProductsWithoutZero(searchString);
	}

	public Object getTotalPagesWithoutZero() {
		return dao.getTotalPagesWithoutZero();
	}
	public Object getTotalPagesWithoutZero(String searchString) {
		return dao.getTotalPagesWithoutZero(searchString);
	}
}