package cn.sfw.zju.lago.system.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sfw.zju.lago.system.dao.CompanyDao;

@Service
public class CompanyService {
	@Autowired
	private CompanyDao cmpDao;
	
	public List<Map<String, Object>> getByCmpFncStage(Map<String, Object> parmMap){
		return this.cmpDao.getByCmpFncStage(parmMap);
	}
}
