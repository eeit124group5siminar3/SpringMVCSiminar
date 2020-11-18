package tw.group5.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.mall.dao.ProductDAO;
import tw.group5.mall.model.CategoryBean;
import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProductImageBean;

@Service
@Transactional

public class ProductService {


	@Autowired
	private ProductDAO dao;

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

	public ProductBean updateProduct(ProductBean bean) {
		return dao.updateProduct(bean);
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

	public int getCategoryId() {
		return dao.getCategoryId();
	}

	public void setCategoryId(Integer categoryId) {
		dao.setCategoryId(categoryId);
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

	public int getTotalPagesWithoutZero() {
		return dao.getTotalPagesWithoutZero();
	}

	public void setMaintainPageNo(Integer maintainPageNo) {
		dao.setMaintainPageNo(maintainPageNo);
	}

	public void setSearchString(String searchString) {
		dao.setSearchString(searchString);
	}

	public ProductImageBean getProductImage(int productId) {
		return dao.getProductImage(productId);
	}


}