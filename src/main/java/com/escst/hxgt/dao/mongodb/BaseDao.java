package com.escst.hxgt.dao.mongodb;

import com.escst.hxgt.common.page.PageResult;
import org.springframework.data.mongodb.core.query.Query;

import java.util.List;

public interface BaseDao {

	<T> T findById(Class<T> entityClass, String id);

	<T> List<T> findAll(Class<T> entityClass);

	void remove(Object obj);

	void add(Object obj);

	void saveOrUpdate(Object obj);

	public <T> List<T> findByQuery(Class<T> entityClass, Query query, PageResult page);

	public <T> Long count(Class<T> entityClass, Query query);
}
