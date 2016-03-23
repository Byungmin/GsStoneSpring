package gs.common.service;

import java.util.Map;

public interface CommonService {

	Map<String, Object> selectFileInfo(Map<String, Object>map)throws Exception;

	void enterCounting(String time);
}
