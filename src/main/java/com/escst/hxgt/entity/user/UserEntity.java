package com.escst.hxgt.entity.user;

import java.io.Serializable;
import java.util.Date;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="user")
public class UserEntity implements Serializable {
    private static final long serialVersionUID = 6342490811136091518L;

    /****/
    public static final String  DEFAULT_PASSWORD = "123456";

    private String _id;
    private String password;
    private String username;
    private String realname;
    private String salt;
    private String roleids;
    private String email;
    private String mobile;
    private String zhengfuid;
    private Date addTime;
    private String belongArea;
    private String belongCity;
    private String belongProvince;
    private Date lastLoginTime;
    private Integer locked;  //0可用 1锁定
    
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the realname
	 */
	public String getRealname() {
		return realname;
	}

	/**
	 * @param realname the realname to set
	 */
	public void setRealname(String realname) {
		this.realname = realname;
	}

	/**
	 * @return the salt
	 */
	public String getSalt() {
		return salt;
	}

	/**
	 * @param salt the salt to set
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}

	/**
	 * @return the roleids
	 */
	public String getRoleids() {
		return roleids;
	}

	/**
	 * @param roleids the roleids to set
	 */
	public void setRoleids(String roleids) {
		this.roleids = roleids;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the zhengfuid
	 */
	public String getZhengfuid() {
		return zhengfuid;
	}

	/**
	 * @param zhengfuid the zhengfuid to set
	 */
	public void setZhengfuid(String zhengfuid) {
		this.zhengfuid = zhengfuid;
	}

	/**
	 * @return the addTime
	 */
	public Date getAddTime() {
		return addTime;
	}

	/**
	 * @param addTime the addTime to set
	 */
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	/**
	 * @return the belongArea
	 */
	public String getBelongArea() {
		return belongArea;
	}

	/**
	 * @param belongArea the belongArea to set
	 */
	public void setBelongArea(String belongArea) {
		this.belongArea = belongArea;
	}

	/**
	 * @return the belongCity
	 */
	public String getBelongCity() {
		return belongCity;
	}

	/**
	 * @param belongCity the belongCity to set
	 */
	public void setBelongCity(String belongCity) {
		this.belongCity = belongCity;
	}

	/**
	 * @return the belongProvince
	 */
	public String getBelongProvince() {
		return belongProvince;
	}

	/**
	 * @param belongProvince the belongProvince to set
	 */
	public void setBelongProvince(String belongProvince) {
		this.belongProvince = belongProvince;
	}

	/**
	 * @return the lastLoginTime
	 */
	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	/**
	 * @param lastLoginTime the lastLoginTime to set
	 */
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	/**
	 * @return the locked
	 */
	public Integer getLocked() {
		return locked;
	}

	/**
	 * @param locked the locked to set
	 */
	public void setLocked(Integer locked) {
		this.locked = locked;
	}

	public String getCredentialsSalt() {
        return username + salt;
    }

}