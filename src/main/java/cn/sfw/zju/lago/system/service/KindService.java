package cn.sfw.zju.lago.system.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.sfw.zju.lago.system.dao.KindDao;

@Service
public class KindService {

	@Autowired
	private KindDao kindDao;
	public List<String> getPositionKind(){
		return kindDao.getPositionKind();
	}
}
