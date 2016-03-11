package gs.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import gs.admin.dao.AdminDAO;
import gs.admin.domain.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public Map<String, Object> openIntro() {
		
		Map<String, Object>resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = adminDAO.openIntro(); 
		
		resultMap.put("list", list);
		
		return resultMap;
	}

	
	
//	@Override
//	public Map<String, Object> transParameter(Map<String, Object> parameterMap) {
//		
//		String page = (String) parameterMap.get("page");
//		String method = (String) parameterMap.get("method");
//		
//		
//		
//		return null;
//	}

}
