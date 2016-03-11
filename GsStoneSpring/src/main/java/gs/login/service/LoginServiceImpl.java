package gs.login.service;

import gs.login.dao.LoginDAO;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public Map<String, Object> loginIdCheck(Map<String, Object> map)throws Exception {
		//입력 받은 ID, Passwd
		int inputId = Integer.parseInt((String) map.get("emp_id"));
		String inputPasswd = (String)map.get("passwd");
		
		//DB내 ID, Passwd
		Map<String, Object>resultMap = loginDAO.loginIdCheck(map);
		
		int resultId = 0;
		String resultPasswd = "";
		
		if(resultMap!=null){
			resultId = (Integer) resultMap.get("emp_id");
			resultPasswd = (String)resultMap.get("passwd");
		}

		if(inputId == resultId && resultId != 0){
			if(inputPasswd.equals(resultPasswd)){
				resultMap.put("isLogin", true);
				return resultMap;
			}
			resultMap.put("isLogin", false);
			resultMap.put("messege", "비밀번호가 틀렸습니다.");
			return resultMap;
		}
		map.put("isLogin", false);
		map.put("messege", inputId+"이란 ID가 없습니다.");
		
		return map;
				
		
	}

}
