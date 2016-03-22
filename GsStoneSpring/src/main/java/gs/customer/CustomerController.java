package gs.customer;

import java.util.List;
import java.util.Map;

import gs.customer.service.CustomerService;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="customerService")
	private CustomerService customerService;

	@RequestMapping(value="/getIntro.gs")
	@ResponseBody
	public Map<String, Object> getIntro(){
		return customerService.getIntro();
	}
	
	@RequestMapping("/getItemList.gs")
	@ResponseBody
	public List<Map<String, Object>> getItemList(){
		return customerService.getItemList();
	}
	
	@RequestMapping(value="/getItemDetail.gs")
	@ResponseBody
	public Map<String, Object> getItemDetail(@RequestParam String IDX){
		System.out.println(IDX);
		return customerService.getItemDetail(IDX);
	}
	
	@RequestMapping(value="/getCatalogues.gs")
	@ResponseBody
	public List<Map<String, Object>> getCatalogues(){
		return customerService.getCatalogues();
	}
	
	
}
