package gs.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import gs.common.common.CommandMap;
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

	public void deleteQna(Map<String, Object> commandMap) {
		update("admin.deleteQna", commandMap);
	}

	public void introChangeNowShowing(Map<String, Object> map) {
		update("admin.introChangeNowShowing", map);
	}

	public void introShowingAllN() {
		update("admin.introShowingAllN", null);
	}

	public void insertIntro(Map<String, Object> map) {
		insert("admin.insertIntro", map);
	}

	public void insertIntroFile(Map<String, Object> map) {
		insert("admin.insertFile",map);
	}

	public List<Map<String, Object>> openFileIntro() {
		return (List<Map<String, Object>>)selectList("admin.openFileIntro");
	}




		


}
