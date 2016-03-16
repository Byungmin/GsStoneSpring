package gs.admin;

import gs.admin.domain.AdminVO;
import gs.admin.service.AdminService;
import gs.common.common.CommandMap;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(value="/main.gs")
	public ModelAndView adminMain(HttpServletRequest req,Model model, AdminVO adminVO, ModelAndView requestMav){
		/*
		 * adminMain.jsp 을 템플릿으로 사용하여 컨트롤러가 1개
		 * 각 페이지이동은 파라미터를 이용하여 이동
		 * request에서 이동할 페이지 값을 받아 map으로 저장
		 * service에서 파라미터를 확인후 해당 로직을 실행
		* */
		
		//템플리 페이지 이동하기
		String page = req.getParameter("page");
		adminVO.setPage(page);
		model.addAttribute("page", page);
		log.debug("page :" + page);
		
		//request parameter -> map으로 저장
//		Enumeration enumber = request.getParameterNames();
//		Map<String, Object> parameterMap = new HashMap<String, Object>();
//		while(enumber.hasMoreElements()){
//			String key = enumber.nextElement().toString();
//			Object value = request.getParameter(key);
//			parameterMap.put(key, value);
//		}
//		Map<String, Object> resultMap = adminService.transParameter(parameterMap);
		
		ModelAndView mv = new ModelAndView("/adminView/adminMain");
		mv.addObject(requestMav);
		return mv;
	}

	//회사소개
	@RequestMapping(value="/openIntro.gs")
	@ResponseBody
	public List<Map<String, Object>> openIntro() throws IOException{
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		resultList = adminService.openIntro();
		return resultList;
	}
	
	
	@RequestMapping(value="/openCustomerQna.gs")
	@ResponseBody
	public List<Map<String, Object>> openCustomerQna() throws IOException{
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		resultList = adminService.openCustomerQna();
		return resultList;
	}
	
	//detailCustomerQna
	@RequestMapping(value="/detailCustomerQna.gs")
	@ResponseBody
	public Map<String, Object> detailCustomerQna(@RequestParam String IDX){
		return adminService.detailCustomerQna(IDX); 
	} 
	
	
	//deleteCustomerQna
	@RequestMapping(value="/deleteQna.gs")
	public void deleteQna(CommandMap commandMap){
		adminService.deleteQna(commandMap.getMap());
	}
	
}
