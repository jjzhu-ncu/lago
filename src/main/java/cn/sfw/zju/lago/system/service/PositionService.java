package cn.sfw.zju.lago.system.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sfw.zju.lago.system.dao.PositionDao;

@Service
public class PositionService {

	@Autowired
	private PositionDao positionDao;
	public List<Map<String, Object>> getPositionNum(Map<String, Object> parmMap){
		return positionDao.getPositionNum(parmMap);
	}
	
	public List<Map<String, Object>> getPositionNumByCity(Map<String, Object> parmMap){
		return positionDao.getPositionNumByCity(parmMap);
	}
	
	public List<Map<String, Integer>> getKindAvgSalaryByCity(String kind){
		return positionDao.getKindAvgSalaryByCity(kind);
	}
	
	public List<String> getCitys(){
		return positionDao.getCitys();
	}
	
	public Map<String, Object> getKAS(Map<String, Object> map){
		return positionDao.getKAS(map);
	}
	
	public List<Map<String, Object>> getAll(Map<String, Object> parmMap){
		return positionDao.getAll(parmMap);
	}
	
	public List<Map<String, Object>> getASByComSize(){
		return positionDao.getASByComSize();
	}
	
}
