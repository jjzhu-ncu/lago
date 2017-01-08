package cn.sfw.zju.lago.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PositionDao {
	public List<Map<String, Object>> getPositionNum(Map<String, Object> parmMap);
	
	public List<Map<String, Object>> getAll(Map<String, Object> parmMap);
	
	public List<Map<String, Object>> getPositionNumByCity(Map<String, Object> parmMap);
	
	public List<Map<String, Integer>> getKindAvgSalaryByCity(@Param("kind") String kind);
	
	public List<String> getCitys();
	
	public Map<String, Object> getKAS(Map<String, Object> map);
	
	
}
