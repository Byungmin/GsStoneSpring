package gs.web.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import gs.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map)throws Exception {
		return (List<Map<String, Object>>)selectList("qna.selectQnaList", map);
	}

	public void insertQna(Map<String, Object> map)throws Exception {
		insert("qna.insertQna", map);
	}

	public void insertFile(Map<String, Object> map)throws Exception {
		insert("qna.insertFile",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map)throws Exception {
		return (Map<String, Object>) selectOne("qna.selectQnaDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaFile(Map<String, Object> map)throws Exception {
		return (List<Map<String,Object>>)selectList("qna.selectFileList", map); 
	}

}
