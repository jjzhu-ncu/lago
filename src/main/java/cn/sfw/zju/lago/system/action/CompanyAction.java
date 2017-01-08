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
	@RequestMapping(value="/getCountBySize" ,method=RequestMethod.POST)
	public Message RequestMethod(HttpServletRequest req, HttpServletResponse res){
		List<Map<String, Object>> result=cmpService.getCountBySize();
		Message m = new Message();
		m.setData(result);
		m.setResponseCode(ResponseCode.SUCCESS);
		return m;	
	}
	
}
