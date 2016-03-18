package gs.admin;

import gs.admin.domain.AdminVO;
import gs.admin.service.AdminService;
import gs.common.common.CommandMap;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	//openIntroPage
	@RequestMapping(value="/openIntro.gs")
	@ResponseBody
	public List<Map<String, Object>> openIntro() throws IOException{
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		resultList = adminService.openIntro();
		return resultList;
	}
	
	//introChangeNowShoing
	@RequestMapping(value="/introChangeNowShoing.gs")
	public void introChangeNowShoing(CommandMap commandMap){
		adminService.introChangeNowShowing(commandMap.getMap());
	}
	
	@RequestMapping(value="/insertIntro.gs")
	public String insertIntro(CommandMap commandMap,HttpServletRequest request){
		try {
			adminService.insertIntro(commandMap.getMap(), request);
		} catch (SQLException e) {
			System.err.println("SQLEception발생 !!!!");
			e.printStackTrace();
		} catch (IOException ioe){
			System.err.println("IOException발생 !!!!");
			ioe.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/main.gs?page=intro_adminPage";
	}
	
	
	
	
//고객 문의
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
	
//아이템 메뉴
	@RequestMapping(value="/insertItem.gs")
	public String insertItem(CommandMap commandMap, HttpServletRequest request) throws Exception{
		adminService.insertIt(commandMap.getMap(), request);
		return "redirect:/admin/main.gs?page=/adminForm/form_item_menu";
	}
	
	@RequestMapping(value="/getItemList.gs")
	@ResponseBody
	public List<Map<String, Object>> getItemList() throws IOException{
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		resultList = adminService.getItemList();
		return resultList;
	}
	
	
	@RequestMapping(value="/getItemDetail.gs")
	@ResponseBody
	public Map<String, Object> getItemDetail(@RequestParam String IDX){
		return adminService.getItemDetail(IDX); 
	} 
	
	@RequestMapping(value="/updateItem.gs")
	public String updateItem(CommandMap map, HttpServletRequest request) throws Exception{
		adminService.updateItem(map.getMap(),request);
		return "redirect:/admin/main.gs?page=/adminForm/form_item_menu";
	}
	
	@RequestMapping(value="/deletePicture.gs")
	public String deletePicture(@RequestParam String BOARD_IDX, @RequestParam String IDX){
		adminService.deletePicture(IDX);
		return "redirect:/admin/main.gs?page=/adminForm/form_Detail_item_menu&IDX="+ BOARD_IDX;
	}
	
	@RequestMapping(value="/insertCatalogue.gs")
	public String insertCatalogue(CommandMap map, HttpServletRequest request)throws Exception{
		adminService.insertCatalouge(map.getMap(), request);
		return "redirect:/admin/main.gs?page=item_adminPage";
	}
	
	//카탈로그
	@RequestMapping(value="/openCatalogue.gs")
	@ResponseBody
	public List<Map<String, Object>> openCatalogue(){
		return adminService.openCatalogue();
	}

	@RequestMapping(value="/getCatalogueDetail.gs")
	@ResponseBody
	public Map<String, Object> getCatalogueDetail(@RequestParam String IDX){
		return adminService.getCatalogueDetail(IDX); 
	} 
	
	@RequestMapping(value="/catalogueUpdate.gs")
	public String updateCatalogue(CommandMap map, HttpServletRequest request) throws Exception{
		adminService.updateCatalogue(map.getMap(),request);
		return "redirect:/admin/main.gs?page=/adminForm/form_item_catalogue";
	}
	
	@RequestMapping(value="/deleteCatalogue.gs")
	public String deleteCatalogue(@RequestParam String IDX){
		adminService.deleteCatalogue(IDX);
		return "redirect:/admin/main.gs?page=/adminForm/form_item_catalogue";
	}
}
