package cn.sfw.zju.lago.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sfw.zju.lago.system.common.Message;
import cn.sfw.zju.lago.system.common.ResponseCode;
import cn.sfw.zju.lago.system.service.PositionService;


@Controller
@RequestMapping("/position/")
public class PositionAction {

	@Autowired
	private PositionService positionService;
	
	@ResponseBody
	@RequestMapping(value = "/getPosNum/", method = RequestMethod.POST)
	public Message getPosNum(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,Object> parmMap) {
		Message message = new Message();
		List<Map<String, Object>> result = positionService.getPositionNum(parmMap);
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
}
