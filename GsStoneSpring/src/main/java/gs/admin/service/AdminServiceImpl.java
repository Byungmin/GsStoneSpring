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
import gs.common.common.CommandMap;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public List<Map<String, Object>> openIntro() {
		
		List<Map<String, Object>> list = adminDAO.openIntro(); 
		
		
		return list;
	}

	@Override
	public List<Map<String, Object>> openCustomerQna() {
		return adminDAO.openCustomer();
	}

	@Override
	public Map<String, Object> detailCustomerQna(String IDX) {
		Map<String, Object>resultMap = new HashMap<String, Object>();
		resultMap = adminDAO.detailCustomerQna(IDX);
		List<Map<String, Object>>fileList = adminDAO.selectFileList(IDX);
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}

	@Override
	public void deleteQna(Map<String, Object> map) {
		adminDAO.deleteQna(map);
	}

}
