package gs.common.service;

import java.util.HashMap;
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

	//접속 카운팅
	@Override
	public void enterCounting(String time) {
		String count = commonDAO.checkCount(time);
		if(count==null||count==""){
			commonDAO.insertCount(time);
		}else{
			int icount=Integer.parseInt(count);
			Map<String, Object>paraMap = new HashMap<String, Object>();
			paraMap.put("time", time);
			paraMap.put("icount", icount+1);
			commonDAO.updateCount(paraMap);
		}
	}
	
	
	
}
