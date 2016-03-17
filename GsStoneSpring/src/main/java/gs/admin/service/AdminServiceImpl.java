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

}
