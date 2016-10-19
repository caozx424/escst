package com.escst.hxgt.service.type;

import java.util.List;
import java.util.Map;

import com.escst.hxgt.common.exception.EscstException;
import com.escst.hxgt.entity.type.TypeEntity;

public interface TypeService {

	public long queryCount(TypeEntity typeEntity) throws EscstException;
	
	public List<TypeEntity> queryByPage(TypeEntity typeEntity, Map<String,Object> map) throws EscstException;
}
