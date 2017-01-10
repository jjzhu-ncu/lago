package cn.sfw.zju.lago.system.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

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

	public List<Map<String, Object>> posPubCountByHour(Map<String, Object> parmMap){
		return cmpDao.posPubCountByHour(parmMap);
	}

	public List<Map<String, Object>> getPosCountByDateAndFncStage(Map<String, Object> parmMap){
		List<Map<String, Object>> queryResult = this.cmpDao.getPosCountByDateAndFncStage(parmMap);
		List<Map<String, Object>> r = new ArrayList<Map<String, Object>>();
		Map<String, ArrayList<HashMap<String, Object>>> result = new TreeMap<String, ArrayList<HashMap<String, Object>>>(new Comparator<String>(){
			@Override
			public int compare(String o1, String o2) {

				return o1.compareTo(o2);
			}

		});
		Iterator<Map<String, Object>> listIter = queryResult.iterator();
		Map<String, Object> elem = null;
		while(listIter.hasNext()){
			elem = listIter.next();
			String time = (String)elem.get("t");
			if(!result.containsKey(time)){
				result.put(time, new ArrayList<HashMap<String, Object>>());
			}
			result.get(time).add((HashMap<String, Object>)elem);
		}
		Set<String> keySet = result.keySet();
		Iterator<String> keyIter = keySet.iterator();
		while(keyIter.hasNext()){
			String key = keyIter.next();
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("time", key);
			m.put("detail", result.get(key));
			r.add(m);
		}
		return r;
	}

	public List<Map<String, Object>> posPubCountByCityAndDate(Map<String, Object> paramMap){
		

		return this.cmpDao.posPubCountByCityAndDate(paramMap);

	}
	
	public List<Map<String, Object>> getCountBySize(){
		return cmpDao.getCountBySize();
	}
	
}
