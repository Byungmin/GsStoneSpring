package gs.web.qna.service;

import java.util.List;
import java.util.Map;


public interface QnaService {

	List<Map<String, Object>> selectQnaList(Map<String, Object> commandMap) throws Exception;

	
	
}
