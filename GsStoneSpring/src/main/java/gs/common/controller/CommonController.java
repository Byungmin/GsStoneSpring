package gs.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import gs.common.common.CommandMap;
import gs.common.service.CommonService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	
	@RequestMapping(value="/common/downloadFile.gs")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request)throws Exception{
		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String)map.get("STORED_FILE_NAME");
		String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
		
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String filePath = contextRoot+"resources/upload/";
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath+storedFileName));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);

	    response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	@RequestMapping(value="/common/thumbnail")
	@ResponseBody
	public void imgThumbnail(CommandMap commandMap){
		log.debug("thumbnail = "+commandMap.get("IDX"));
		
	}
	
	@RequestMapping(value="/common/enterCounting.gs")
	public String enterCounting(@RequestParam String time){
		commonService.enterCounting(time);
		return "redirect:/cataloguePage.gs";
	}
	
	
}
