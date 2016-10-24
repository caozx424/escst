package com.escst.hxgt.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import com.escst.hxgt.service.mongodb.MongoDBService;
import com.google.gson.Gson;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

@Controller
@RequestMapping("file")
public class FileCommonController {
	
	private Logger logger = LoggerFactory.getLogger(FileCommonController.class);
	
	private static final String FILE_UPLOAD_ERROR = "文件上传失败";
	
	@Autowired
	private MongoDBService mongoDBService;
	

	/**
	 * 上传文件
	 * @param request
	 * @return
	 */
	@RequestMapping("uploadFile")
	@ResponseBody
	public Object uploadFile(HttpServletRequest request) throws IOException{
		Gson gson = new Gson();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		//先判断request中是否包含multipart类型的数据
		String fileUrl = "";
		if(multipartResolver.isMultipart(request)){
			//request数据转化成multipart类型的数据
			MultipartHttpServletRequest mutliHttpServletRequest = (MultipartHttpServletRequest)request;
			Iterator<String> iterator = mutliHttpServletRequest.getFileNames();
			while(iterator.hasNext()){
				MultipartFile file = mutliHttpServletRequest.getFile((String)iterator.next());
				if(file!=null){
					GridFSInputFile gridFSInputFile = mongoDBService.save(file);
					if(gridFSInputFile==null){
						return FILE_UPLOAD_ERROR;
					} else {
						fileUrl = gridFSInputFile.getId().toString();
					}
				}
			}
		}
		Map<String, Object> map = new HashMap<String, Object>(); 
		fileUrl = request.getContextPath() + fileUrl;
		map.put("status", 200);
		map.put("data", fileUrl);
		String json = gson.toJson(map);
		return json;
	}
	

	/**
	 * 下载文件
	 * @param id
	 * @param response
	 */
	@RequestMapping("downloadFile")
	public void getFile(String id, HttpServletResponse response) {
		GridFSDBFile file = mongoDBService.getById(id);
		OutputStream os = null;
		InputStream is = null;
		try {
			os = response.getOutputStream();
			is = file.getInputStream();
			byte[] b = new byte[2048];
			int i = 0;
			while((i=is.read(b))!=-1){
				os.write(b, 0, i);
			}
			os.flush();
			os.close();
			is.close();
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		} finally{
			IOUtils.closeQuietly(os);
			IOUtils.closeQuietly(is);
		}

	}
}
