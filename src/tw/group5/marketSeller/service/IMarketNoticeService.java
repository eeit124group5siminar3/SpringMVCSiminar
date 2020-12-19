package tw.group5.marketSeller.service;

import java.util.List;

import tw.group5.marketSeller.model.MarketNotice;

public interface IMarketNoticeService {

	List<MarketNotice> selectBuyerNotice(Integer mid);

	boolean delete(int productId);

	MarketNotice insert(MarketNotice bean);

	MarketNotice update(MarketNotice bean);

	MarketNotice selectOne(int mId);

	List<MarketNotice> sendEmail(Integer mid);

//	MarketNotice selectOne(int productId, int mid);

}