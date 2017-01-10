package cn.sfw.zju.lago.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface CompanyDao {
	
	public List<Map<String, Object>> getByCmpFncStage(Map<String, Object> parmMap);
	public List<Map<String, Object>> getPosCountByDateAndFncStage(Map<String, Object> parmMap);
	public List<Map<String, Object>> posPubCountByHour(Map<String, Object> parmMap);
	public List<Map<String, Object>> posPubCountByCityAndDate(Map<String, Object> parmMap);
	
	public List<Map<String, Object>> getCountBySize();
}
