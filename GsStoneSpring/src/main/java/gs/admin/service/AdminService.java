package gs.admin.service;

import gs.common.common.CommandMap;

import java.util.List;
import java.util.Map;

public interface AdminService {

	//Map<String, Object> transParameter(Map<String, Object> parameterMap);

	public List<Map<String, Object>> openIntro();

	public List<Map<String, Object>> openCustomerQna();

	public Map<String, Object> detailCustomerQna(String IDX);

	public void deleteQna(Map<String, Object> map);

}
