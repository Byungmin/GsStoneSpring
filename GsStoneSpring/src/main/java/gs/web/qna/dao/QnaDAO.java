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

}
