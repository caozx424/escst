package com.escst.hxgt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.escst.hxgt.entity.type.TypeEntity;
import com.escst.hxgt.service.type.TypeService;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value="type")
public class TypeController extends BaseController{
	
	@Resource(name="typeService")
	private TypeService typeService;

	
	@RequestMapping(value="list")
	public String list(TypeEntity typeEntity,@RequestParam(required=false) Integer currentPage,Model model) {
		long count = typeService.queryCount(typeEntity);
		Map<String,Object> map = queryPageInfo(currentPage,count);
		List<TypeEntity> list = typeService.queryByPage(typeEntity,map);
		queryData(model,list,map);
		if(typeEntity!=null){
			model.addAttribute("typeEntity",typeEntity);
		}
		return "type/list";
	}

}
