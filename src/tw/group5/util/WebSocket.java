package tw.group5.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class WebSocket {
	
	private Map<String, String> content = new HashMap<String,String>();
	private Map<String, String> admin_content = new HashMap<String,String>();
	private Map<String, String> admin_content_all = new HashMap<String,String>();

	//使用者端儲存訊息
	@RequestMapping(path = "/websocket_content.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, String> Socket_content(@RequestParam(name = "name", required = false) String socket_name,
			@RequestParam(name = "socket", required = false) String socket_content) {
		if (socket_content != null && socket_name != null) {
			content.put(socket_name,socket_content);
		}
		return content;
	}	
	
	//使用者端跳轉頁面回傳訊息
	@RequestMapping(path = "/websocket_content_windows.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> Socket_windows() {
		return content;
	}	
	
	//Admin 存左邊訊息
	@RequestMapping(path = "/admin_websocket_content.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, String> Admin_socket_content(@RequestParam(name = "name", required = false) String socket_name,
			@RequestParam(name = "socket", required = false) String socket_content) {

//		admin_content.remove(socket_name);
		admin_content.put(socket_name, socket_content);
		System.err.println("這啥"+admin_content);
		return admin_content;
	}	
	
	//Admin端跳轉頁面回傳左邊訊息
	@RequestMapping(path = "/admin_websocket_content_windows.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> Admin_socket_windows() {
		return admin_content;
	}	
	
	//Admin 存所有訊息
	@RequestMapping(path = "/admin_websocket_content_all.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, String> Admin_socket_content_all(@RequestParam(name = "name", required = false) String socket_name,
			@RequestParam(name = "socket", required = false) String socket_content) {

		admin_content_all.put(socket_name, socket_content);
		System.err.println("這是啥"+admin_content_all);
		return admin_content_all;
	}	
	//Admin端跳轉頁面回傳所有訊息
	@RequestMapping(path = "/admin_websocket_content_windows_all.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> Admin_socket_windows_all() {
		return admin_content_all;
	}	

	
}
