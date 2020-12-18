package tw.group5.recipe.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;

import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import oracle.jdbc.internal.OracleDate;
import oracle.net.aso.m;
import oracle.sql.DATE;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.DAO.AnalysisBLOG_DAO;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.recipe_Bean.Recipe_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes({ "login_ok", "blogBean", "editBean", "memBean", "msgBean", "bean" })
public class Recipe_blog {

	@Autowired
	private HttpSession session;

	@Autowired
	private recipe_Service_interface service;

	@Autowired
	private Blog_Bean blogBean;

	@Autowired
	private ServletContext ctx;
	
	@Autowired
	private AnalysisBLOG_DAO analysisService;

	// 連到首頁
	@GetMapping(value = "/blogPage")
	public String blogPage(Model m) throws ParseException {
		List<Blog_Bean> searchAll = service.searchPopular(); // status
		List<Blog_Bean> searchOpen = new ArrayList<Blog_Bean>();
		List<Integer> counts = new ArrayList<Integer>();

		// 回文數
		for (Blog_Bean b : searchAll) {
			if (b.getStatus() == 1) {
				searchOpen.add(b);
				counts.add((int) service.BlogMsgCounts(b.getBlog_id()));
			}
		}
		m.addAttribute("searchAll", searchOpen);
		m.addAttribute("counts", counts);

		// 分類 類別總數
		List<String> cateList = service.cateList();
		List<Long> cateCounts = new ArrayList<Long>();
		for (String b : cateList) {
			cateCounts.add(service.blogCateCounts(b));
		}
		m.addAttribute("cateList", cateList);
		m.addAttribute("cateCounts", cateCounts);
		
//		int count=(int) analysisService.PageviewsbyDate(5,"2020/12/1","2020/12/31");
		System.out.println("----------------------------------------------------5555555555555555555");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date start = calendar.getTime();
		System.out.println("start: "+start);
		Calendar calendarEnd = Calendar.getInstance();
		calendarEnd.setTime(new Date());
		calendarEnd.set(Calendar.DAY_OF_MONTH, calendarEnd.getActualMaximum(Calendar.DAY_OF_MONTH));
//		calendarEnd.set(Calendar.HOUR_OF_DAY, 0);
//		calendarEnd.set(Calendar.MINUTE, 0);
//		calendarEnd.set(Calendar.SECOND, 0);
//		calendarEnd.set(Calendar.MILLISECOND, 0);
//		calendarEnd.set(Calendar.DAY_OF_MONTH, 30);
		Date end = calendarEnd.getTime();
		System.out.println("end: "+end);

		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
//		Date start=sdf.parse("2020/12/1");
//		
//		Date end=sdf.parse("2020/12/31");
		
		
		List<Msg_Blog_Bean> viewsList= analysisService.PageviewsbyDate(30,start,end);
//		System.out.println(count);
		for(Msg_Blog_Bean msgBean:viewsList) {
			System.out.println(msgBean.getName());
		}
		System.out.println("--------------------------------------6666666666666666666666666666");
		
		return "recipe/recipe_blog";
	}

	// 連到詳細頁面
	@GetMapping(value = "/SinglePage")
	public String SinglePage(Model m, @RequestParam(name = "blog_id") Integer blog_id) throws SQLException {
		Blog_Bean bean = service.blogBean(blog_id);
		System.out.println(bean.getViews());
		bean.setViews(bean.getViews() + 1);
		System.out.println(bean.getViews());

		service.updateBlog(bean);
		Blog_Bean partSearch = service.blogBean(blog_id);
		int counts = (int) service.BlogMsgCounts(blog_id);
		partSearch.setCounts(counts);
		m.addAttribute("partSearch", partSearch);

		// 排行
		List<Blog_Bean> searchPopular = service.searchPopular();

		Integer id1 = searchPopular.get(0).getBlog_id();
		Integer id2 = searchPopular.get(1).getBlog_id();
		Integer id3 = searchPopular.get(2).getBlog_id();
		Blog_Bean popular1 = service.blogBean(id1);
		Blog_Bean popular2 = service.blogBean(id2);
		Blog_Bean popular3 = service.blogBean(id3);
		m.addAttribute("popular1", popular1);
		m.addAttribute("popular2", popular2);
		m.addAttribute("popular3", popular3);

		List<Integer> chat = new ArrayList<Integer>();
		chat.add((int) service.BlogMsgCounts(searchPopular.get(0).getBlog_id()));
		chat.add((int) service.BlogMsgCounts(searchPopular.get(1).getBlog_id()));
		chat.add((int) service.BlogMsgCounts(searchPopular.get(2).getBlog_id()));
		m.addAttribute("chat", chat);

		// 回文資料
		List<Msg_Blog_Bean> searchMsg = service.searchMsg(blog_id);
		m.addAttribute("searchMsg", searchMsg);

		// 作者資料
		Member_Detail detailBean = service.detailBean(partSearch.getMem_no());
		m.addAttribute("detailBean", detailBean);

		// 分類 類別總數
		List<String> cateList = service.cateList();
		List<Long> cateCounts = new ArrayList<Long>();
		for (String b : cateList) {
			cateCounts.add(service.blogCateCounts(b));
		}
		m.addAttribute("cateList", cateList);
		m.addAttribute("cateCounts", cateCounts);
		return "recipe/blog_single";
	}
	
	//查詢分類
	@PostMapping(value = "/chooseBlogCate")
	public String chooseBlogCate(@RequestParam(name="cate")String cate,Model m){
		System.out.println("======================================");
		System.out.println("cate: "+cate);
		List<Blog_Bean> cateList=service.categoryBlogList(cate);
		System.out.println("succccccccccccccces");
		m.addAttribute("cateList",cateList);
		return "recipe/blog_catePage";
	}

	// member BlogPage
	@GetMapping(value = "/blog_personal")
	public String blog_personal(Model m) {
		Member_SignUp OK = (Member_SignUp) session.getAttribute("login_ok");
		Integer mem_no = OK.getMember_no();
		System.out.println(mem_no);
		blogBean.setMem_no(mem_no);
		List<Blog_Bean> list = service.getMemBlog(mem_no);
		m.addAttribute("user_blog", list);
		return "recipe/blog_personal";
	}

	// 判斷開啟關閉
	@PostMapping(value = "/checkStatus")
	@ResponseBody
	public boolean checkStatus(@RequestParam(name = "blog_id") Integer blog_id) {
		Blog_Bean bean = service.blogBean(blog_id);
		Integer status = bean.getStatus();
		System.out.println(bean.getBlog_id() + " : " + bean.getStatus());
		if (status == 1) {
			bean.setStatus(0);
			service.updateBlog(bean);
			return false;
		} else if (status == 0) {
			bean.setStatus(1);
			service.updateBlog(bean);
			System.out.println(bean.getStatus());
			return true;
		} else {
			bean.setStatus(0);
			return false;
		}

	}

	// 撰寫文章
	@GetMapping(value = "/blogEdit")
	public String blogEdit(Model m) {
		Blog_Bean editBean = new Blog_Bean();
		Member_SignUp OK = (Member_SignUp) session.getAttribute("login_ok");
		Integer mem_no = OK.getMember_no();
		editBean.setMem_no(mem_no);
		String name = OK.getMember_name();
		editBean.setName(name);
		m.addAttribute("editBean", editBean);
		return "recipe/blog_edit";
	}

	// 送出新增
	@PostMapping(value = "/blogContent")
	public String blogPostContent(@ModelAttribute("editBean") Blog_Bean blogBean) {
		Blog_Bean bean = (Blog_Bean) session.getAttribute("editBean");
		System.out.println(bean.getContent());

		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date = year + "-" + month + "-" + day;
		
		
		bean.setDate(date);
		System.out.println(bean.getDate());

		service.insert(bean);
		return "redirect:/blog_personal";

	}

	// 送出修改
	@PostMapping(value = "/blogPostUpdate")
	public String blogPostUpdate(@ModelAttribute("memBean") Blog_Bean memBean) {
//		Blog_Bean bean=(Blog_Bean) session.getAttribute("memBean");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date = year + "-" + month + "-" + day;
		memBean.setUpdate_date(date);
		System.out.println(memBean.getUpdate_date());

		service.updateBlog(memBean);
		return "redirect:/blog_personal";

	}

	@PostMapping(value = "/blogPostDelete")
	public String blogPostDelete(@RequestParam(name = "blog_id") Integer blog_id) {
		service.deleteBlog(blog_id);
		return "redirect:/blog_personal";
	}

	// 搜尋單筆資料
	@GetMapping(value = "/getIdContent")
	public String getIdContent(Model m, @RequestParam(name = "blog_id") Integer blog_id) {
		System.out.println(blog_id);
		Blog_Bean memBean = service.blogBean(blog_id);
		m.addAttribute("memBean", memBean);
		return "recipe/test_edit";
	}

	// 文章回文
	@PostMapping(value = "/msgContent")
	public String msgContent(@RequestParam(name = "content") String content,
			@RequestParam(name = "blog_id") Integer blog_id, Model m) throws ParseException {
		Msg_Blog_Bean bean = new Msg_Blog_Bean();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date = year + "-" + month + "-" + day;
//		Date date=new Date();		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date today=sdf.parse(date);
		bean.setDate(today);
		
		System.err.println("bean.getDate(): "+bean.getDate());
		Blog_Bean partSearch = service.blogBean(blog_id);
		bean.setBlog_Bean(partSearch);

		if (session.getAttribute("login_ok") != null) {
			Member_SignUp OK = (Member_SignUp) session.getAttribute("login_ok");
			Integer mem_no = OK.getMember_no();
			String name = OK.getMember_name();
			bean.setMem_no(mem_no);
			bean.setName(name);
			bean.setContent(content);
			service.insertMsg(bean);
			int counts = (int) service.BlogMsgCounts(blog_id);
			List<Msg_Blog_Bean> searchMsg = service.searchMsg(blog_id);
			m.addAttribute("counts", counts);
			m.addAttribute("searchMsg", searchMsg);

			return "recipe/msgForm";

		} else if (session.getAttribute("login_ok") == null) {
			bean.setName("訪問者");
			bean.setContent(content);
			service.insertMsg(bean);
			int counts = (int) service.BlogMsgCounts(blog_id);
			List<Msg_Blog_Bean> searchMsg = service.searchMsg(blog_id);
			m.addAttribute("counts", counts);
			m.addAttribute("searchMsg", searchMsg);
			return "recipe/msgForm";
		}

		return "recipe/recipe_blog";
	}

	@PostMapping(value = "/msgSearch")
	public boolean msgSearch(Model m, Integer blog_id) {
		List<Msg_Blog_Bean> list = service.searchMsg(blog_id);
		m.addAttribute("msgSearch", list);
		return true;
	}

	// 搜尋文章
	@PostMapping(value = "/searchPartOfBlog")
	@ResponseBody
	public ModelAndView searchPartOfBlog(@RequestParam(name = "searchInput") String title, Model m) {
		String search = "%" + title.trim() + "%";
		System.out.println(search);
		List<Blog_Bean> list = service.searchPartOfBlog(search);
		List<Blog_Bean> partSearch = new ArrayList<Blog_Bean>();
		List<Integer> counts = new ArrayList<Integer>();
		for (Blog_Bean b : list) {
			if (b.getStatus() == 1) {
				partSearch.add(b);
				counts.add((int) service.BlogMsgCounts(b.getBlog_id()));
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/recipe/searchForm");
		mav.addObject("partSearch", partSearch);
		mav.addObject("counts", counts);
		return mav;
//		m.addAttribute("counts",counts);
//		m.addAttribute("partSearch",partSearch);
//		return "recipe/searchForm";
	}

	// 部落格分類
	@PostMapping(value = "/categoryBlogList")
	public String categoryBlogList(@RequestParam(name = "cate") String cate, Model m) {
		List<Blog_Bean> categoryList = service.categoryBlogList(cate);
		List<Integer> counts = new ArrayList<Integer>();
		for (Blog_Bean b : categoryList) {
			int count = (int) service.blogCateCounts(b.getCate());
			counts.add(count);
		}

		m.addAttribute("categoryList", categoryList);
		m.addAttribute("counts", counts);
		return "recipe/blog_catePage";
	}

	// 取得圖片
	@GetMapping(value = "/getImage")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(@RequestParam(name = "mem_no") Integer mem_no)
			throws SQLException, IOException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		Member_Detail bean = service.detailBean(mem_no);
		blob = bean.getData();
		fileName = bean.getFileName();

		String mimeType = ctx.getMimeType(fileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();

		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		InputStream is = blob.getBinaryStream();

		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		is.close();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<byte[]>(baos.toByteArray(), headers, HttpStatus.OK);
		return re;

	}

	@GetMapping(value = "/getBlogImage")
	@ResponseBody
	public ResponseEntity<byte[]> getBlogImage(@RequestParam(name = "blog_id", required = false) Integer blog_id)
			throws IOException, SQLException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		Blog_Bean bean = service.blogBean(blog_id);
		if (blog_id != null) {
			blob = bean.getData();
			fileName = bean.getFileName();
		}

		String mimeType = ctx.getMimeType(fileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//				
		InputStream is = blob.getBinaryStream();

		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		is.close();
		// 放入header,告知瀏覽器
		headers.setContentType(mediaType);
		// 避免資料顯示錯誤.noCache()
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//				byte[] bytes = baos.toByteArray();
		re = new ResponseEntity<byte[]>(baos.toByteArray(), headers, HttpStatus.OK);

		return re;

	}
}
