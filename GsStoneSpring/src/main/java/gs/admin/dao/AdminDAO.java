package gs.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import gs.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openIntro() {
		return (List<Map<String, Object>>)selectList("admin.openIntro");
	}




		


}
