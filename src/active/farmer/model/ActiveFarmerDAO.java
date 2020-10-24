package active.farmer.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class ActiveFarmerDAO {

	// 設定與取得Session (but不負責建立與關閉)
	private Session session;

	public ActiveFarmerDAO(Session session) {
		this.session = session;
	}

	// 新增資料
	public ActiveFarmer insert(ActiveFarmer activefarmer) {
		ActiveFarmer result = session.get(ActiveFarmer.class, activefarmer.getActId());

		// 如果id不存在執行insert,反之則否
		if (result == null) {
			session.save(activefarmer);
			return activefarmer;
		}
		return null;
	}

	// 查詢單筆資料
	public ActiveFarmer selectOne(int actId) {
		return session.get(ActiveFarmer.class, actId);
	}

	// 查詢多筆資料
	public List<ActiveFarmer> selectAll() {
		Query<ActiveFarmer> query = session.createNamedQuery("From ActiveFarmer", ActiveFarmer.class);
		List<ActiveFarmer> list = query.list();
		return list;
	}

	// 更新資料
	public ActiveFarmer update(ActiveFarmer activefarmer) {
		ActiveFarmer result = session.get(ActiveFarmer.class, activefarmer.getActId());

		// 如果id不存在執行insert,反之則否
		if (result == null) {
			result.setActName(activefarmer.getActName());
			result.setActType(activefarmer.getActType());
			result.setActAddr(activefarmer.getActAddr());
			result.setTel(activefarmer.getTel());
			result.setActDate(activefarmer.getActDate());
			result.setActTimeSta(activefarmer.getActTimeSta());
			result.setActTimeEnd(activefarmer.getActTimeEnd());
			result.setNumLim(activefarmer.getNumLim());
//			result.setMemberNo(activefarmer.getMemberNo()); 廠商不可改
			result.setPrice(activefarmer.getPrice());
			result.setActDescri(activefarmer.getActDescri());
			result.setImgName(activefarmer.getImgName());
			result.setActImg(activefarmer.getActImg());
			result.setActLock(activefarmer.getActLock());
			
//			String actName = null;
//			String actType = null;
//			String actAddr = null;
//			String tel = null;
//			Date actDate = null;
//			Timestamp actTimeSta = null;
//			Timestamp actTimeEnd = null;
//			int numLim = 0;
//			int price = 0;
//			String actDescri = null;
//			String imgName = null;
//			Blob actImg = null;
//			int actLock = 0;
//			
//			result.setActName(actName);
//			result.setActType(actType);
//			result.setActAddr(actAddr);
//			result.setTel(tel);
//			result.setActDate(actDate);
//			result.setActTimeSta(actTimeSta);
//			result.setActTimeEnd(actTimeEnd);
//			result.setNumLim(numLim);
////			result.setMemberNo(memberNo); 廠商不可改
//			result.setPrice(price);
//			result.setActDescri(actDescri);
//			result.setImgName(imgName);
//			result.setActImg(actImg);
//			result.setActLock(actLock);

		}
		return null;
	}

	public boolean delete (int actId) {
		ActiveFarmer result = session.get(ActiveFarmer.class, actId);
		
		if(result!=null) {
			session.delete(result);
			return true;
		}

		return false;
	}
}
