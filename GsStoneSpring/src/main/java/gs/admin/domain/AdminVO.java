package gs.admin.domain;

import java.util.Map;

public class AdminVO {
	
	
	private String page;
	private Map<String, Object> parameterMap;
	
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public Map<String, Object> getParameterMap() {
		return parameterMap;
	}
	public void setParameterMap(Map<String, Object> parameterMap) {
		this.parameterMap = parameterMap;
	}
	
	

}
