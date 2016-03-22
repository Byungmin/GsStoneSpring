package gs.customer.service;

import gs.customer.dao.CustomerDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Resource(name="customerDAO")
	private CustomerDAO customerDAO;
	
	//현재 게시중인 회사소개 가져오기
	@Override
	public Map<String, Object> getIntro() {
		Map<String, Object>intro = customerDAO.getIntro(); 
		
		String picture = intro.get("picture").toString();
		if(picture.equals("new")){
			int idx = Integer.parseInt(intro.get("num").toString());
			Map<String, Object>introFile = customerDAO.getIntroFlie(idx);
			intro.put("picture", introFile.get("STORED_FILE_NAME"));
		}
		
		return intro;
	}

	//드롭다운 메뉴 가져오기
	@Override
	public List<Map<String, Object>> getItemList() {
		return customerDAO.getItemList();
	}

	//item 상세정보
	@Override
	public Map<String, Object> getItemDetail(String idx) {
		Map<String, Object>resultMap = customerDAO.getItemDetail(idx); 
		List<Map<String, Object>>itemFile = customerDAO.getItemFile(idx);
		resultMap.put("itemFile", itemFile);
		return resultMap;
	}

	//제품소개 카탈로그
	@Override
	public List<Map<String, Object>> getCatalogues() {
		List<Map<String, Object>>catals = customerDAO.getCatalogues();
		for(int i=0,n=catals.size();i<n;i++){
			String idx=catals.get(i).get("IDX").toString();
			Map<String, Object>img = customerDAO.getImg(idx);
			if(img!=null){
				catals.get(i).put("img", img);
			}else{
				catals.get(i).put("img", "no image");
			}
		}
		return catals;
	}
	
}
