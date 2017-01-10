package cn.sfw.zju.lago.system.action;

import java.util.ArrayList;
import java.util.HashMap;
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
import cn.sfw.zju.lago.system.service.KindService;
import cn.sfw.zju.lago.system.service.PositionService;


@Controller
@RequestMapping("/position/")
public class PositionAction {

	@Autowired
	private PositionService positionService;
	
	@Autowired
	private KindService kindService;
	
	@ResponseBody
	@RequestMapping(value = "/getPosNum/", method = RequestMethod.POST)
	public Message getPosNum(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,Object> parmMap) {
		Message message = new Message();
		List<Map<String, Object>> result = positionService.getPositionNum(parmMap);
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPosNumByCity/", method = RequestMethod.POST)
	public Message getPosNumByCity(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,Object> parmMap) {
		Message message = new Message();
		List<Map<String, Object>> result = positionService.getPositionNumByCity(parmMap);
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAll/", method = RequestMethod.POST)
	public Message getAll(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,Object> parmMap) {
		Message message = new Message();
		List<Map<String, Object>> result = positionService.getAll(parmMap);
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getPosKind/", method = RequestMethod.POST)
	public Message getPosKind(HttpServletRequest request,HttpServletResponse response) {
		Message message = new Message();
		List<String> result = kindService.getPositionKind();
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPosCity/", method = RequestMethod.POST)
	public Message getPosCity(HttpServletRequest request,HttpServletResponse response) {
		Message message = new Message();
		List<String> result = positionService.getCitys();
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getASByComSize/", method = RequestMethod.POST)
	public Message getASByComSize(HttpServletRequest request,HttpServletResponse response) {
		Message message = new Message();
		String[] kinds={"Java","Python","PHP","C++",".NET","Hadoop"};
		String[] companySizes={"15-50人","50-150人","150-500人","500-2000人","2000人以上"};
		List<Map<String, Object>> result = positionService.getASByComSize();
		
		for(Map<String, Object> map:result){
			if(map.get("kind").equals("Java")) map.replace("kind", (Object)0);
			else if(map.get("kind").equals("Python")) map.replace("kind", (Object)1);
			else if(map.get("kind").equals("PHP")) map.replace("kind", (Object)2);
			else if(map.get("kind").equals("C++")) map.replace("kind", (Object)3);
			else if(map.get("kind").equals(".NET")) map.replace("kind", (Object)4);
			else if(map.get("kind").equals("Hadoop")) map.replace("kind", (Object)5);	
			if(map.get("companySize").equals("15-50人")) map.replace("companySize", (Object)0);
			if(map.get("companySize").equals("50-150人")) map.replace("companySize", (Object)1);
			if(map.get("companySize").equals("150-500人")) map.replace("companySize", (Object)2);
			if(map.get("companySize").equals("500-2000人")) map.replace("companySize", (Object)3);
			if(map.get("companySize").equals("2000人以上")) map.replace("companySize", (Object)4);
		}
		Map<String, Object> data=new HashMap<String, Object>();
		data.put("kinds", kinds);
		data.put("companySizes", companySizes);
		data.put("result", result);
		message.setData(data);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
	
	/**
	 * 有问题 为什么是空
	 * @param request
	 * @param response
	 * @param parmMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getKindAvgSalaryByCity/", method = RequestMethod.POST)
	public Message getKindAvgSalaryByCity(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,Object> parmMap) {
		Message message = new Message();
		//List<String> kinds = kindService.getPositionKind();
		String[] kinds={"Java","Hadoop","Python","C++","数据挖掘"};
		List<String> citys=positionService.getCitys(); 
		//String[] citys={"北京","上海","杭州","深圳","南京"};
		Map<String, List<Double>> salarys= new HashMap<>();
		for(String kind: kinds){
			List<Double> mylist=new ArrayList<Double>();
			for(String city:citys){
				Map<String, Object> queryMap= new HashMap<>();
				queryMap.put("kind", kind);
				queryMap.put("city", city);
				Map<String, Object> item=positionService.getKAS(queryMap);
				mylist.add((Double) item.get("zg"));
			}
			salarys.put(kind, mylist);
		}
		Map<String, Object> result= new HashMap<>();
		result.put("salary", salarys);
		result.put("kinds", kinds);
		result.put("citys", citys);
		message.setData(result);
		message.setResponseCode(ResponseCode.SUCCESS);
		return message;
	}
	
}
