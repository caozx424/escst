package com.escst.hxgt.common.exception;

/**
 * 数据访问层抛出DAOException
 * @author wx
 *
 */
public class DaoException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	/**  消息码    */
	private long msgCode;
	
	/**   错误信息      */
	private String message;

	public DaoException() {
		super();
	}

	public DaoException(String message) {
		super(message);
	}

	public DaoException(long msgCode) {
		super();
		this.msgCode = msgCode;
	}

	public DaoException(long msgCode, String message) {
		super();
		this.msgCode = msgCode;
		this.message =  message;
	}

	public long getMsgCode() {
		return msgCode;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setMsgCode(long msgCode) {
		this.msgCode = msgCode;
	}

	@Override
	public String toString() {
		return "msgCode:" + this.msgCode + ",message" + this.message;
	}
}
