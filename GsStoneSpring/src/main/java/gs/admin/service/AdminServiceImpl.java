package gs.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import gs.admin.dao.AdminDAO;
import gs.common.util.FileUtils;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> openIntro() {

		List<Map<String, Object>> list = adminDAO.openIntro();
		List<Map<String, Object>> fileList = adminDAO.openFileIntro();

		/*
		 * 새로운 DB 형식인 STORED_FILE_NAME을 기존 DB picture에 붙임
		 * 
		 */

		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> tempMap = null;
			tempMap = list.get(i);

			String picturVal = tempMap.get("picture").toString();
			int numVal = -1;
			if (picturVal.equals("new")) {
				numVal = Integer.parseInt(tempMap.get("num").toString());
			}

			for (int j = 0, n = fileList.size(); j < n; j++) {
				int introIDX = Integer.parseInt(fileList.get(j).get("INTRO_IDX").toString());
				if (numVal == introIDX) {
					tempMap.put("picture", fileList.get(j).get("STORED_FILE_NAME"));
					list.set(i, tempMap);
				}
			}
		}// for

		return list;
	}

	@Override
	public List<Map<String, Object>> openCustomerQna() {
		return adminDAO.openCustomer();
	}

	@Override
	public Map<String, Object> detailCustomerQna(String IDX) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminDAO.detailCustomerQna(IDX);
		List<Map<String, Object>> fileList = adminDAO.selectFileList(IDX);
		resultMap.put("fileList", fileList);

		return resultMap;
	}

	@Override
	public void deleteQna(Map<String, Object> map) {
		adminDAO.deleteQna(map);
	}

	@Override
	public void introChangeNowShowing(Map<String, Object> map) {
		adminDAO.introShowingAllN();
		adminDAO.introChangeNowShowing(map);
	}

	@Override
	public void insertIntro(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminDAO.insertIntro(map);

		// 기존 intro값 컬럼명 변경 작업(introFile 컬럼명으로 맞추기)
		Map<String, Object> transMap = map;
		transMap.put("CREA_ID", map.get("id"));
		transMap.put("IDX", map.get("num"));

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(transMap, request);
		for (int i = 0; i < list.size(); i++) {
			adminDAO.insertIntroFile(list.get(i));
		}

	}

	@Override
	public void insertIt(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminDAO.insertItem(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0; i < list.size(); i++) {
			adminDAO.insertItemFile(list.get(i));
		}
	}

	//아이템리스트
	@Override
	public List<Map<String, Object>> getItemList() {
		return adminDAO.getItemList();
	}

	
	//itemDetail 값 가져오기
	@Override
	public Map<String, Object> getItemDetail(String iDX) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminDAO.getItemDetail(iDX);
		List<Map<String, Object>> fileList = adminDAO.selectItemFileList(iDX);
		resultMap.put("fileList", fileList);
		return resultMap;
	}

	//item 수정하기
	@Override
	public void updateItem(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminDAO.updateItem(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		Map<String, Object> tempMap = null;
		for(int i=0, size=list.size();i<size;i++){
			tempMap =list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				adminDAO.insertItemFile(tempMap);
			}
		}
	}

	//메뉴 사진 삭제
	@Override
	public void deletePicture(String iDX) {
		adminDAO.deletePicture(iDX);
	}

	//카탈로그 추가
	@Override
	public void insertCatalouge(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminDAO.insertCatalouge(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0; i < list.size(); i++) {
			adminDAO.insertCatalougeFile(list.get(i));
		}
	}

	//카탈로그 리스트 가져오기
	@Override
	public List<Map<String, Object>> openCatalogue() {
		List<Map<String, Object>> list = adminDAO.openCatalogue();
		
		for(int i=0,n=list.size();i<n;i++){
			Map<String, Object> tempMap = list.get(i);
			int boardIDX = Integer.parseInt(tempMap.get("IDX").toString());
			Map<String, Object>file = adminDAO.openCatalogueFile(boardIDX);
			tempMap.put("imgFile", file);
			list.set(i,tempMap);
		}
		return list;
	}

	
	//카탈로그 상세정보
	@Override
	public Map<String, Object> getCatalogueDetail(String iDX) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminDAO.getCatalogueDetail(iDX);
		List<Map<String, Object>> fileList = adminDAO.selectCatalogueFileList(iDX);
		resultMap.put("fileList", fileList);
		return resultMap;
	}

	
	
	@Override
	public void updateCatalogue(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminDAO.updateCatalogue(map);
	     
		adminDAO.deleteCatalogueFileList(map);
		    List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		    Map<String,Object> tempMap = null;
		    for(int i=0, size=list.size(); i<size; i++){
		        tempMap = list.get(i);
		        if(tempMap.get("IS_NEW").equals("Y")){
		        	adminDAO.insertCatalougeFile(tempMap);
		        }
		        else{
		        	adminDAO.updateCatalogueFile(tempMap);
		        }
		    }
		
	}
	
	
	
}
