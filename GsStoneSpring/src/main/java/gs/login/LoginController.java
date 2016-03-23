package gs.login;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import gs.common.common.CommandMap;
import gs.login.service.LoginService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/loginIdCheck.gs")
	public ModelAndView loginIdCheck(CommandMap commandMap, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/login.gs");
		
		Map<String, Object>resultLoginInfo = loginService.loginIdCheck(commandMap.getMap());
		
		boolean isLogin = (Boolean) resultLoginInfo.get("isLogin");
		
		//mv.addobject
		mv.addObject("resultLoginInfo", resultLoginInfo);
		
		//세션 설정
		if(isLogin){
		session.setAttribute("sessionMap", resultLoginInfo);
		}
		return mv;
	}
	
	@RequestMapping(value="/logOut.gs")
	public String logOut(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/item.gs";
	}
	
}
