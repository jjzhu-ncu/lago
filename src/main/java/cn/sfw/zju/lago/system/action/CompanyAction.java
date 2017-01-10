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
import cn.sfw.zju.lago.system.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyAction {
	@Autowired
	private CompanyService cmpService;
	
	@ResponseBody
	@RequestMapping(value="/getByCmpFncStage", method=RequestMethod.POST)
	public Message getByCmpFncStage(HttpServletRequest req, HttpServletResponse res,@RequestBody Map<String,Object> parmMap){
		
		List<Map<String, Object>> result = this.cmpService.getByCmpFncStage(parmMap);
		Message m = new Message();
		m.setData(result);
		m.setResponseCode(ResponseCode.SUCCESS);
		return m;
	}
	
	@ResponseBody
	@RequestMapping(value="/getPosCountByDateAndFncStage", method=RequestMethod.POST)
	public Message getPosCountByDateAndFncStage(HttpServletRequest req, HttpServletResponse res,@RequestBody Map<String,Object> parmMap){
		
		List<Map<String, Object>> result = this.cmpService.getPosCountByDateAndFncStage(parmMap);
		Message m = new Message();
		m.setData(result);
		m.setResponseCode(ResponseCode.SUCCESS);
		return m;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/posPubCountByHour", method=RequestMethod.POST)
	public Message posPubCountByHour(HttpServletRequest req, HttpServletResponse res, @RequestBody Map<String, Object> parmMap){
		
		Message msg = new Message();
		msg.setData(this.cmpService.posPubCountByHour(parmMap));
		msg.setResponseCode(ResponseCode.SUCCESS);
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value="/posPubCountByCityAndDate", method=RequestMethod.POST)
	public Message posPubCountByCityAndDate(HttpServletRequest req, HttpServletResponse res, @RequestBody Map<String, Object> parmMap){
		
		Message msg = new Message();
		msg.setData(this.cmpService.posPubCountByCityAndDate(parmMap));
		msg.setResponseCode(ResponseCode.SUCCESS);
		return msg;
	}
	
}
