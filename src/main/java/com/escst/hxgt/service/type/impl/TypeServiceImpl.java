package com.escst.hxgt.service.type.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import com.escst.hxgt.common.exception.EscstException;
import com.escst.hxgt.common.page.PageResult;
import com.escst.hxgt.dao.type.TypeDao;
import com.escst.hxgt.entity.type.TypeEntity;
import com.escst.hxgt.service.type.TypeService;

@Service("typeService")
public class TypeServiceImpl implements TypeService {
	
	@Autowired
	private TypeDao typeDao;
	
	@Override
	public List<TypeEntity> queryByPage(TypeEntity typeEntity, Map<String,Object> map) throws EscstException {
		Query query = new Query();
		PageResult page = new PageResult();
		int currentPage = (Integer)map.get("currentPage");
		int pageSize = (Integer)map.get("pageSize");
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		List<TypeEntity> list =typeDao.findByQuery(TypeEntity.class, query, page);
		return list;
	}

	@Override
	public long queryCount(TypeEntity typeEntity) throws EscstException {
		Query query = new Query();
		Long count = typeDao.count(TypeEntity.class, query);
		return count;
	}

}
