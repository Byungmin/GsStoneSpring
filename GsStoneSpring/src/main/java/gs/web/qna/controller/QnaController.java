package gs.web.qna.controller;

import java.util.List;
import java.util.Map;

import gs.common.common.CommandMap;
import gs.web.qna.service.QnaService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	
	@RequestMapping(value="/qna/insertQna.gs")
	public String insertQna(CommandMap map, HttpServletRequest request) throws Exception{
		qnaService.insertQna(map.getMap(),request);
		return "redirect:/item.gs";
	}
	
	@RequestMapping(value="/admin/openQnaList.gs")
	public ModelAndView openQnaList(Map<String, Object> commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/adminView/testView");
		List<Map<String, Object>> list = qnaService.selectQnaList(commandMap);
		mv.addObject("list", list);
		return mv;
	}
	
	
}//
