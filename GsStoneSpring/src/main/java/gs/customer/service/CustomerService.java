package gs.customer.service;

import java.util.List;
import java.util.Map;

public interface CustomerService {

	Map<String, Object> getIntro();

	List<Map<String, Object>> getItemList();

	Map<String, Object> getItemDetail(String idx);

	List<Map<String, Object>> getCatalogues();

}
