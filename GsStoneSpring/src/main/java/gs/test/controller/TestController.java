package gs.test.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping(value="/home.gs")
	public String testController() throws Exception{
		log.debug("intercepter Test ");
		return "/customView/item";
	}
	
}
