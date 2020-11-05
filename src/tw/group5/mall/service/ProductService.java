package tw.group5.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.group5.mall.dao.ProductDAO;
import tw.group5.mall.model.CategoryBean;
import tw.group5.mall.model.ProductBean;

@Service
public class ProductService {

//	private  Session session;
	@Autowired
	private ProductDAO dao;

//	public ProductService(Session session) {
//		this.dao = new ProductDAO(session);
//	}

//	@Transactional(rollbackFor = {Exception.class})
	public int getTotalPages() {
		return dao.getTotalPages();
	}

	public int getTotalPages(int producterId) {
		return dao.getTotalPages(producterId);
	}

	public List<ProductBean> getPageProducts() {
		return dao.getPageProducts();
	}

	public List<ProductBean> getPageProducts(int producterId) {
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

	public ProductBean updateProduct(ProductBean bean, long sizeInBytes) {
		return dao.updateProduct(bean, sizeInBytes);
	}

	public ProductBean deleteProduct(int no) {
		return dao.deleteProduct(no);
	}

	public ProductBean saveProduct(ProductBean bean) {
		return dao.saveProduct(bean);
	}

	public List<CategoryBean> getCategory() {
		return dao.getCategory();
	}

	public void setSelected(int category) {
		dao.setSelected(category);
	}

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