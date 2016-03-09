package gs.common.service;

import java.util.Map;

import gs.common.dao.CommonDAO;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map)throws Exception {
		return commonDAO.selectFileInfo(map);
	}
	
	
	
}
