package tw.group5.active.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import oracle.security.o3logon.a;
import tw.group5.active.model.Active;
import tw.group5.active.model.ActiveService;
import tw.group5.member_SignUp.model.Member_SignUp;

@Controller
public class ActiveHomeController {

	@Autowired
	private ActiveService activeService;
	
	@Autowired
	private HttpServletRequest request;

	// 查詢全部(首頁跳轉)
	@RequestMapping(path = "/activeHomeSelectAll.controller", method = RequestMethod.GET)
	public String processSelectAll(Model m) {
		
		List<Active> listAct = activeService.selectAll();
		//判斷有無登入成功
//		Member_SignUp bean=(Member_SignUp )m.getAttribute("login_ok");
//		Integer member_no = bean.getMember_no();
		m.addAttribute("listAct", listAct);
		System.out.println(listAct);
		return "active/ActiveHome";
	}

	// 查詢單筆(依據名字)
	@RequestMapping(path = "/activeSelectone.controller", method = RequestMethod.GET)
	public String ProcessSelectName(@RequestParam("selectname") String actName, Model m) {
		List<Active> listAct = activeService.selectName(actName);
		m.addAttribute("listAct", listAct);
		return "active/ActiveHome";
	}

	// 導向申請頁面
	@RequestMapping(path = "/activePreInsert.controller", method = RequestMethod.POST)
	public String preInsert() {
		return "active/ActiveApply";
	}

	// 新增
	@RequestMapping(path = "/activeInsert.controller", method = RequestMethod.POST)
	public String processInsert(@RequestParam("actName") String actName, @RequestParam("actType") String actType,
			@RequestParam("actAddr") String actAddr, @RequestParam("tel") String tel,
			@RequestParam("actDate") Date actDate, @RequestParam("dateSta") Date dateSta,
			@RequestParam("dateEnd") Date dateEnd, @RequestParam("expNum") int expNum, @RequestParam("price") int price,
			@RequestParam("actDescri") String actDescri,
			@RequestParam("actImg") MultipartFile actImg) throws IllegalStateException, IOException {
		
		String imgName = actImg.getOriginalFilename();
		String fileTempDirPath = request.getSession().getServletContext().getRealPath("/") + "UploadTempDir\\";
		 
		File dirPath = new File(fileTempDirPath);
		  if (!dirPath.exists()) {
			boolean status =dirPath.mkdir();
			System.out.println("status:" + status);
		}
		  
		String fileSavePath =fileTempDirPath +imgName;
		File savFile = new File(fileSavePath);
		actImg.transferTo(savFile);
		System.out.println("fileSavePath: " + fileSavePath);
		
		Active aBean = new Active();
		if(imgName!=null && imgName.length()!=0) {
			try {
				aBean.setImgName(imgName);
				FileInputStream is1 =new FileInputStream(fileSavePath);
				byte[] b = new byte[is1.available()];
				is1.read(b);
				is1.close();
				aBean.setActImg(b);
			}catch ( Exception e) {
				e.printStackTrace();
			}
		}
		
		aBean.setActName(actName);
		aBean.setActAddr(actAddr);
		aBean.setActType(actType);
		aBean.setTel(tel);
		aBean.setActDate(actDate);
		aBean.setDateSta(dateSta);
		aBean.setDateEnd(dateEnd);
		aBean.setExpNum(expNum);
		aBean.setPrice(price);
		aBean.setActDescri(actDescri);
		
		activeService.insert(aBean);
		return "redirect:/activeHomeSelectAll.controller";
//		return "active/ActiveSucc";
	}

	// 刪除
	@RequestMapping(path = "/acitveDelet.controller", method = RequestMethod.POST)
	public String processDelet(@RequestParam("actId") int actId) {
		activeService.delete(actId);
//		return "active/ActiveSucc";
		return "redirect:/activeHomeSelectAll.controller";
	}

	// 導向修改頁面
	@RequestMapping(path = "/activePreUpdate.controller", method = RequestMethod.POST)
	public String preUpdate(@RequestParam("actId") int actId, Model m) {
		Active active = activeService.select(actId);
		m.addAttribute("Active", active);
		System.out.println("活動類型" + active.getActType());
		return "active/ActiveUpdate";
	}

	//更新
	@RequestMapping(path = "/activeUpdate.controller", method = RequestMethod.POST)
	public String processUpdate(@RequestParam("actId") int actId, @RequestParam("actName") String actName,
			@RequestParam("actType") String actType, @RequestParam("actAddr") String actAddr,
			@RequestParam("tel") String tel, @RequestParam("actDate") Date actDate,
			@RequestParam("dateSta") Date dateSta, @RequestParam("dateEnd") Date dateEnd,
			@RequestParam("expNum") int expNum, @RequestParam("price") int price,
			@RequestParam("actDescri") String actDescri) {
		Active aBean = new Active(actId, actName, actType, actAddr, tel, actDate, dateSta, dateEnd, expNum, price,
				actDescri);
		activeService.update(actId, aBean);
		return "redirect:/activeHomeSelectAll.controller";
//		return "active/ActiveSucc";
	}

}
