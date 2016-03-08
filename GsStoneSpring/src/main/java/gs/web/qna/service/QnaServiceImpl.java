package gs.web.qna.service;

import gs.web.qna.dao.QnaDAO;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	 Logger log = Logger.getLogger(this.getClass());
	 
	 @Resource(name="qnaDAO")
	 private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map)throws Exception {
		return qnaDAO.selectQnaList(map);
	}

	@Override
	public void insertQna(Map<String, Object> map) {
		qnaDAO.insertQna(map);
		
	}
	
	

	
	
}
