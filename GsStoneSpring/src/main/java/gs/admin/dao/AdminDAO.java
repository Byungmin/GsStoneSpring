package gs.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import gs.common.dao.AbstractDAO;

@SuppressWarnings("unchecked")
@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {

	public List<Map<String, Object>> openIntro() {
		return (List<Map<String, Object>>)selectList("admin.openIntro");
	}

	public List<Map<String, Object>> openCustomer() {
		return (List<Map<String, Object>>)selectList("admin.openCustomer");
	}

	public Map<String, Object> detailCustomerQna(String IDX) {
		return (Map<String, Object>)selectOne("admin.detailCustomerQna", IDX);
	}

	public List<Map<String, Object>> selectFileList(String iDX) {
		return (List<Map<String, Object>>)selectList("admin.fileCustomerQna", iDX);
	}




		


}
