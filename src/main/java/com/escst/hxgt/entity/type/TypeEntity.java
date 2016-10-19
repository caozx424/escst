package com.escst.hxgt.entity.type;

import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by caozx on 2016/9/5.
 */
@Document(collection="type")
public class TypeEntity {
	private String _id;
    private String typecode;    //编码
    private String typename;    //名称
    private String typepid;     //父id
    private String typegroupid;  //组id
    
	/**
	 * @return the _id
	 */
	public String get_id() {
		return _id;
	}
	/**
	 * @param _id the _id to set
	 */
	public void set_id(String _id) {
		this._id = _id;
	}
	/**
	 * @return the typecode
	 */
	public String getTypecode() {
		return typecode;
	}
	/**
	 * @param typecode the typecode to set
	 */
	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}
	/**
	 * @return the typename
	 */
	public String getTypename() {
		return typename;
	}
	/**
	 * @param typename the typename to set
	 */
	public void setTypename(String typename) {
		this.typename = typename;
	}
	/**
	 * @return the typepid
	 */
	public String getTypepid() {
		return typepid;
	}
	/**
	 * @param typepid the typepid to set
	 */
	public void setTypepid(String typepid) {
		this.typepid = typepid;
	}
	/**
	 * @return the typegroupid
	 */
	public String getTypegroupid() {
		return typegroupid;
	}
	/**
	 * @param typegroupid the typegroupid to set
	 */
	public void setTypegroupid(String typegroupid) {
		this.typegroupid = typegroupid;
	}
    
}
