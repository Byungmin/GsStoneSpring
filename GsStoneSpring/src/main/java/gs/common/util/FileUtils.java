package gs.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	
	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object>map, HttpServletRequest request)throws Exception{
		
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String filePath = contextRoot+"resources/upload/";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;

		String crea_id = (String)map.get("CREA_ID");
		int boardIdx = Integer.parseInt((map.get("IDX").toString()));
		
		File file = new File(filePath);
		if(file.exists()==false){
			file.mkdirs();
		}
		
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()==false){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString()+originalFileExtension;
				int fileSize = (int) multipartFile.getSize();
				file = new File(filePath+storedFileName);
				multipartFile.transferTo(file);
				
				
				listMap = new HashMap<String,Object>();
                listMap.put("BOARD_IDX", boardIdx);
                listMap.put("ORIGINAL_FILE_NAME", originalFileName);
                listMap.put("STORED_FILE_NAME", storedFileName);
                listMap.put("FILE_SIZE", fileSize);
                listMap.put("CREA_ID", crea_id);
                list.add(listMap);

			}
		}
		return list;
	}

}
