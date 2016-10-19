package basetest.dao;

import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import org.junit.Test;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import basetest.BaseTest;
import com.escst.hxgt.dao.mongodb.MongoDBBaseDao;
import com.escst.hxgt.entity.type.TypeEntity;

public class TestBaseDao extends BaseTest{

	@Resource(name = "mongoDBBaseDao")
	MongoDBBaseDao mongoDBBaseDao;
	
	@Test
	public void testAdd(){
		TypeEntity typeEntity = new TypeEntity();
		typeEntity.set_id(UUID.randomUUID().toString());
		typeEntity.setTypecode("3");
		typeEntity.setTypename("测试");
		typeEntity.setTypegroupid(UUID.randomUUID().toString());
		mongoDBBaseDao.add(typeEntity);
		System.out.println("add typename:" + typeEntity.getTypename());
	}
	@Test
	public void testFindAll(){
		List<TypeEntity> typeList = mongoDBBaseDao.findAll(TypeEntity.class);
		for (TypeEntity typeEntity : typeList) {
			System.out.println("id:"+typeEntity.get_id()+" typename:"+typeEntity.getTypename()+"  typecode:"+typeEntity.getTypecode());
		}
		System.out.println("获取全部的数据----------------------");
	}
	
	@Test
	public void testFindById(){
		TypeEntity typeEntity = mongoDBBaseDao.findById(TypeEntity.class, "57ff1363a7f2181c7008351f");
		System.out.println(typeEntity.getTypename());
		System.out.println("获取单个对象----------------------");
	}
	
	@Test
	public void testUpdate(){
		TypeEntity typeEntity = mongoDBBaseDao.findById(TypeEntity.class, "57ff1363a7f2181c7008351f");
		typeEntity.setTypename("caozx111");
		mongoDBBaseDao.saveOrUpdate(typeEntity);
		TypeEntity newtypeEntity = mongoDBBaseDao.findById(TypeEntity.class, "57ff1363a7f2181c7008351f");
		System.out.println(newtypeEntity.getTypename());
		System.out.println("修改数据成功");
		this.mongoDBBaseDao.saveOrUpdate(newtypeEntity);
	}
	
	@Test
	public void testRemove(){
		TypeEntity typeEntity = mongoDBBaseDao.findById(TypeEntity.class, "57ff1363a7f2181c7008351f");
		mongoDBBaseDao.remove(typeEntity);
		TypeEntity oldType=this.mongoDBBaseDao.findById(TypeEntity.class, "57ff1363a7f2181c7008351f");
		if(oldType == null){
			System.out.println(oldType==null);
			System.out.println("删除对象成功");
		}
		mongoDBBaseDao.add(typeEntity);
	}
	
	@Test
	public void testCount(){
		Query query = new Query();
		Criteria criteria = new Criteria();
		criteria.and("typename").is("系统图标");
		query.addCriteria(criteria);
		long total = mongoDBBaseDao.count(TypeEntity.class, query);
		System.out.println("用户总数:"+total);
	}
}
