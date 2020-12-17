package tw.group5.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class WebSocket {
	
	private Map<String, String> content = new HashMap<String,String>();

	@RequestMapping(path = "/websocket_content.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, String> Socket_content(@RequestParam(name = "name", required = false) String socket_name,
			@RequestParam(name = "socket", required = false) String socket_content) {
		System.err.println("hh"+socket_content);
//		HashMap<String, String> content = new HashMap<String, String>();

		if (socket_content != null && socket_name != null) {
			content.put(socket_name,socket_content);
		}
		System.err.println(content);
		System.err.println("22222222222222222222");
		return content;
	}	
	
	@RequestMapping(path = "/websocket_content_windows.controller", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> Socket_windows() {
		System.err.println(content);
		return content;
	}	
	

	
}
