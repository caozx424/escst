package com.escst.hxgt.common.exception;

/**
 * 业务类异常
 * @author wx
 * 
 */
public class EscstException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**   错误码(方便国际化)   */
	private long msgCode;
	
	/**   错误信息      */
	private String message;
	
	/** 异常抛出时需要返回的数据 */
	private Object[] datas;
	
	public EscstException() {
		super();
	}

	public EscstException(String message) {
		super();
		this.message = message;
	}

	public EscstException(Throwable cause) {
		super();
		this.message = cause.getMessage();
	}

	public EscstException(long msgCode, Throwable cause) {
		super();
		this.msgCode = msgCode;
		this.message = cause.getMessage();
	}

	public EscstException(long msgCode) {
		this.msgCode = msgCode;
	}

	public EscstException(long msgCode, String message) {
		this.msgCode = msgCode;
		this.message = message;
	}
	
	public EscstException(long msgCode,Object[] datas) {
		this.msgCode = msgCode;
		this.datas = datas;
	}

	public long getMsgCode() {
		return this.msgCode;
	}

	public String getMessage() {
		return this.message;
	}

	public Object[] getDatas() {
		return datas;
	}

	public void setDatas(Object[] datas) {
		this.datas = datas;
	}
	
	@Override
	public String toString() {
		return "msgCode:" + this.msgCode + ",message:" + this.message;
	}
}
