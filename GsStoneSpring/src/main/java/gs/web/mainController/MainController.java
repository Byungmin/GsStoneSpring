package gs.web.mainController;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());

	//introPage
	@RequestMapping(value="/intro.gs")
	public String introPage() throws Exception{
		return "/customView/introPage";
	}
	
	//item
	@RequestMapping(value="/cataloguePage.gs")
	public String cataloguePage() throws Exception{
		return "/customView/cataloguePage";
	}
	
	@RequestMapping(value="/item.gs")
	public String itemPage() throws Exception{
		return "/customView/itemPage";
	}

	//고객문의 페이지
	@RequestMapping(value="/customer.gs")
	public String customerPage() throws Exception{
		return "/customView/customerPage";
	}
	
	//직원로그인 페이지
	@RequestMapping(value="/login.gs")
	public String adminLogin()throws Exception{
		return "/customView/loginPage";
	}
	

	
	
	
}//
