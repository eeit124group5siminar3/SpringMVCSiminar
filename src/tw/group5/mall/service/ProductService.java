package tw.group5.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.mall.dao.ProductDAO;

import tw.group5.mall.model.ProductBean;
import tw.group5.mall.model.ProductFavoriteBean;
import tw.group5.mall.model.ProductImageBean;
import tw.group5.member_SignUp.model.Member_SignUp;

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

	public ProductBean getProduct(int productId, Member_SignUp mb) {
		ProductBean productBean = dao.getProduct(productId);
		if (mb != null) {
			Integer userId = mb.getMember_no();
			ProductFavoriteBean pfb=dao.getFavorite(userId, productBean.getProductId());
			if (pfb != null&&pfb.getStatus()==1) {
				productBean.setFavorite(1);
			} else {
				productBean.setFavorite(0);
			}
		}else {
			productBean.setFavorite(0);
		}
		return productBean;
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

//	public List<CategoryBean> getCategory() {
//		return dao.getCategory();
//	}

	public void setSelected(int category) {
		dao.setSelected(category);
	}

//	public CategoryBean getCategoryById() {
//		return dao.getCategoryById();
//	}

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

	public List<ProductBean> getPageProductsWithoutZero(Member_SignUp mb) {
		List<ProductBean> list = dao.getPageProductsWithoutZero();
		if (mb != null) {
			Integer userId = mb.getMember_no();
			for (ProductBean productBean : list) {
				ProductFavoriteBean pfb=dao.getFavorite(userId, productBean.getProductId());
				if (pfb != null&&pfb.getStatus()==1) {
					productBean.setFavorite(1);
				} else {
					productBean.setFavorite(0);
				}
			}
			}else {
				for (ProductBean productBean : list) {
					productBean.setFavorite(0);
				}
		}
		return list;
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

	public String getSearchString() {
		return dao.getSearchString();
	}

	public ProductImageBean getProductImage(int productId) {
		return dao.getProductImage(productId);
	}

	public ProductFavoriteBean saveFavorite(ProductFavoriteBean pfb) {
		return dao.savaFavorite(pfb);
	}

	public ProductFavoriteBean getFavorite(Integer userId, Integer productId) {
		return dao.getFavorite(userId, productId);
	}

	public List<ProductBean> getFavoriteList(Integer userId) {
		return dao.getFavoriteList(userId);
	}

	public void cancelFavorite(Integer userId, Integer productId) {
		dao.cancelFavorite(userId, productId);
		
	}

}