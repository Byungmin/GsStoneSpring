package gs.login.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import gs.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> loginIdCheck(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("login.loginIdCheck", map);
	}

	
	
	
}
