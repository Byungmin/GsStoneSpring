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

	public void insertIt(Map<String, Object> map, HttpServletRequest request)throws Exception;

	public List<Map<String, Object>> getItemList();

	public Map<String, Object> getItemDetail(String iDX);

	public void updateItem(Map<String, Object> map, HttpServletRequest request) throws Exception;

	public void deletePicture(String iDX);

	public void insertCatalouge(Map<String, Object> map, HttpServletRequest request)throws Exception;

	public List<Map<String, Object>> openCatalogue();

	public Map<String, Object> getCatalogueDetail(String iDX);

	public void updateCatalogue(Map<String, Object> map, HttpServletRequest request) throws Exception;

	public void deleteCatalogue(String iDX);


}
