package NActive;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class NActiveInsertServlet
 */
@WebServlet("/NActiveInsertServlet")
public class NActiveInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		request.setAttribute("ErrMsg", errorMsgs);
		session.setAttribute("successMsg", successMsgs);
		
		try {
			String act_id;
			String act_name;
			String act_addr;
			String tel;
			int exp_num;
			Date act_date;
			Date date_sta;
			Date date_end;
			int price;
			String act_type;
			Clob act_descri;
			String img_name;
			String vid_name;

			long sizeInBytes = 0;
			InputStream is = null;
			
			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
			// javax.servlet.http.Part: 代表上傳到Server的資料，可以是正常的表單資料(form data)，
			// 也可以上傳的檔案。
			// Part介面可以:
			// 1. 傳回欄位的名稱(<input>的name屬性)、大小、ContentType
			// 2. 每個Part的Header
			// 3. 刪除Part
			// 4. 將Part寫入硬碟
			Collection<Part> parts = request.getParts();
			if(parts != null) {
				for(Part p : parts) {
					String fldname = p.getName();
					String value = request.getParameter(fldname);
					if(p.getContentType() == null) {
						// 表示 p 為一般欄位而非上傳的表單
						// 根據欄位名稱來讀取欄位的內容，然後存入適當的變數內
						if(fldname.equals("actName")) {
							act_name = value;
							if(value == null || actName.trim().length() == 0) {
								errorMsgs.compute("errAct", remappingFunction)
							}
						}
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
