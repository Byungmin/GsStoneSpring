package gs.customer.dao;

import gs.common.dao.AbstractDAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("customerDAO")
@SuppressWarnings("unchecked")
public class CustomerDAO extends AbstractDAO{
	
	public Map<String, Object> getIntro() {
		return (Map<String, Object>)selectOne("customer.getIntro");
	}

	public Map<String, Object> getIntroFlie(int idx) {
		return (Map<String, Object>)selectOne("customer.getIntroFlie", idx);
	}

	public List<Map<String, Object>> getItemList() {
		return (List<Map<String, Object>>)selectList("customer.getItemList");
	}

	public Map<String, Object> getItemDetail(String idx) {
		return (Map<String, Object>)selectOne("customer.getItemDetail", idx);
	}

	public List<Map<String, Object>> getItemFile(String idx) {
		return (List<Map<String, Object>>)selectList("customer.getItemFile", idx);
	}

	public List<Map<String, Object>> getCatalogues() {
		return (List<Map<String, Object>>)selectList("customer.getCatalogues");
	}

	public Map<String, Object> getImg(String idx) {
		return (Map<String, Object>)selectOne("customer.getImg", idx);
	}

}
