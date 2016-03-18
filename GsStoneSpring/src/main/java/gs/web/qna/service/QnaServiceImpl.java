package gs.web.qna.service;

import gs.common.util.FileUtils;
import gs.web.qna.dao.QnaDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	 Logger log = Logger.getLogger(this.getClass());
	 
	 @Resource(name="fileUtils")
	 private FileUtils fileUtils;
	 
	 @Resource(name="qnaDAO")
	 private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map)throws Exception {
		return qnaDAO.selectQnaList(map);
	}

	@Override
	public void insertQna(Map<String, Object> map, HttpServletRequest request)throws Exception {
		qnaDAO.insertQna(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0,size=list.size();i<size;i++){
			qnaDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map)throws Exception {
		
		Map<String, Object>resultMap = new HashMap<String, Object>();
		Map<String, Object>tempMap = qnaDAO.selectQnaDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> fileList = qnaDAO.selectQnaFile(map);
		resultMap.put("list", fileList);
		
		
		return resultMap;
	}
	
	
	

	
	
}
