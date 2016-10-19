package com.escst.hxgt.controller;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.escst.hxgt.common.page.PageResult;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletResponse;

public class BaseController {

	/**
	 * 分页展示时每个分页展示的记录数(最小)
	 */
	protected final int PAGE_SIZE_MIN = 10;
	/**
	 * 分页展示时每个分页展示的记录数(一般)
	 */
	protected final int PAGE_SIZE_MEDIUM = 20;
	/**
	 * 分页展示时每个分页展示的记录数(最大)
	 */
	protected final int PAGE_SIZE_MAX = 30;

	/**
	 * ajax返回的json格式的字符串
	 */
	protected String json;

	/**
	 * 以html的形式输出信息
	 * @param msg 需要输出的信息
	 */
	protected void outputMsg(String msg,HttpServletResponse response)
	{
		response.setContentType("text/html;charset=utf-8");
		try
		{
			PrintWriter writer = response.getWriter();
			writer.write(StringUtils.hasLength(msg)?msg:"");
			writer.flush();
			writer.close();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}


	/**
	 * 向页面输出图片
	 * @param path
	 * @throws Exception
	 */
	protected void outputImg(String path,HttpServletResponse response) throws Exception
	{
		response.setContentType("image/*");
		InputStream is = null;
		OutputStream os = null;
		try
		{
			is = new FileInputStream(new File(path));
			byte[]data = new byte[is.available()];
			is.read(data);
			is.close();
			os= response.getOutputStream();
			os.write(data);
			os.flush();
		} catch (Exception e){
			e.printStackTrace();
		}
		finally
		{
			if (is!=null)
			{
				is.close();
			}
			if (os!=null)
			{
				os.close();
			}
		}
	}

	//初始化分页相关信息
	protected Map<String,Object> queryPageInfo(Integer currentPage, long totalCount){
		Map<String,Object> map = new HashMap<String,Object>();
		Integer totalPage = (int) ((totalCount + PAGE_SIZE_MIN-1)/PAGE_SIZE_MIN);
		if(null == currentPage){
			currentPage = 1;
		}else if(currentPage > totalPage){
			currentPage = totalPage;
		}
		//第currentPage - 1页最后一条记录的序列号
		int start = (currentPage - 1) * PAGE_SIZE_MIN;
		map.put("start", start);
		map.put("currentPage", currentPage);
		map.put("totalPage", totalPage);
		map.put("pageSize", PAGE_SIZE_MIN);
		map.put("totalCount", totalCount);
		return map;
	}

	//将相关数据放入model
	protected void queryData(Model model, List<?> list, Map<String,Object> map){
		int currentPage = (Integer)map.get("currentPage");
		int totalPage = (Integer)map.get("totalPage");
		Long totalCount = (Long)map.get("totalCount");
		PageResult page = new PageResult();
		page.setVos(list);
		page.setCurrentPage(currentPage);
		page.setTotalCount(totalCount);
		page.setTotalPage(totalPage);
		model.addAttribute("page", page);
	}
	
}
