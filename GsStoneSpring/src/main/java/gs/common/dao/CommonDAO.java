package gs.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository("commonDAO")
public class CommonDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("common.selectFileInfo", map);
	}

	public String checkCount(String time) {
		return (String)selectOne("common.checkCount", time);
	}

	public void insertCount(String time) {
		insert("common.insertCount", time);
	}

	public void updateCount(Map<String, Object> paraMap) {
		update("common.updateCount", paraMap);
	}

}
