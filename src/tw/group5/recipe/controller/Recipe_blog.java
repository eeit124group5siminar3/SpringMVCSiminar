package tw.group5.recipe.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
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
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import oracle.net.aso.m;
import tw.group5.member_SignUp.model.Member_SignUp;
import tw.group5.recipe.recipe_Bean.Blog_Bean;
import tw.group5.recipe.recipe_Bean.Member_Detail;
import tw.group5.recipe.recipe_Bean.Msg_Blog_Bean;
import tw.group5.recipe.service.recipe_Service_interface;

@Controller
@SessionAttributes({ "login_ok", "blogBean", "editBean", "memBean", "msgBean" })
public class Recipe_blog {

	@Autowired
	private HttpSession session;

	@Autowired
	private recipe_Service_interface service;

	@Autowired
	private Blog_Bean blogBean;

	@Autowired
	private ServletContext ctx;

	// 連到首頁
	@GetMapping(value = "/blogPage")
	public String blogPage(Model m) {
		List<Blog_Bean> searchAll = service.searchPopular();
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

		return "recipe/recipe_blog";
	}

	// 連到詳細頁面
	@GetMapping(value = "/SinglePage")
	public String SinglePage(Model m, @RequestParam(name = "blog_id") Integer blog_id) {
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
		
		//作者資料
		Member_Detail detailBean=service.detailBean(partSearch.getMem_no());
		m.addAttribute("detailBean",detailBean);
		return "recipe/blog_single";
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
		System.out.println(editBean.getMem_no());
		String name = OK.getMember_name();
		editBean.setName(name);
		System.out.println("bean.getName(): " + editBean.getName());
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
		System.out.println("----------------------");
		m.addAttribute("memBean", memBean);
		return "recipe/test_edit";
	}

	// 文章回文
	@PostMapping(value = "/msgContent")
	public String msgContent(@RequestParam(name = "content") String content,
			@RequestParam(name = "blog_id") Integer blog_id, Model m) {
		Msg_Blog_Bean bean = new Msg_Blog_Bean();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date = year + "-" + month + "-" + day;
		bean.setDate(date);
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
		System.err.println("-------------------------------------");
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

	// 取得圖片
	@GetMapping(value = "/getBlogImage")
	@ResponseBody
	public ResponseEntity<byte[]> getBlogImage(@RequestParam(name = "blog_id", required = false) Integer blog_id)
			throws SQLException, IOException {
		ResponseEntity<byte[]> re = null;
		Blob blob = null;
		String fileName = null;
		List<Blog_Bean> list = service.searchAllOfBlog();
		if (blog_id != null) {
			for (Blog_Bean b : list) {
				if (b.getBlog_id() == blog_id) {
					blob = b.getData();
					fileName = b.getFileName();
				}
			}
		} else {
			for (Blog_Bean b : list) {
				blob = b.getData();
				fileName = b.getFileName();
			}
		}
		System.out.println(blob);

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
}
