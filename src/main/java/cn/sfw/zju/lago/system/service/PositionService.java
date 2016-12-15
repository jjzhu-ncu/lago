package cn.sfw.zju.lago.system.service;

import java.util.List;
import java.util.Map;

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
	
}
