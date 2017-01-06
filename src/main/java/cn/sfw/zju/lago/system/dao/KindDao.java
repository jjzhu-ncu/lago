package cn.sfw.zju.lago.system.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository
public interface KindDao {
	public List<String> getPositionKind();

}
