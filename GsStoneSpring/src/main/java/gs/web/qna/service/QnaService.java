package gs.web.qna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface QnaService {

	List<Map<String, Object>> selectQnaList(Map<String, Object> commandMap) throws Exception;

	void insertQna(Map<String, Object> map, HttpServletRequest request) throws Exception;


	
	
}
