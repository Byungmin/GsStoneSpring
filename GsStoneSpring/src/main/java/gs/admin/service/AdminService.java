package gs.admin.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminService {

	//Map<String, Object> transParameter(Map<String, Object> parameterMap);

	public List<Map<String, Object>> openIntro();

	public List<Map<String, Object>> openCustomerQna();

	public Map<String, Object> detailCustomerQna(String IDX);

	public void deleteQna(Map<String, Object> map);

	public void introChangeNowShowing(Map<String, Object> map);

	public void insertIntro(Map<String, Object> map, HttpServletRequest request)throws Exception;


}
