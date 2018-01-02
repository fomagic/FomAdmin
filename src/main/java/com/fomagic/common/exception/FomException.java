package com.fomagic.common.exception;

/**
 * 自定义异常
 * 
 * @author FOM
 *
 */
public class FomException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String msg;
	private int code = 500;

	public FomException(String msg) {
		super(msg);
	}

	public FomException(String msg, Throwable e) {
		super(msg, e);
		this.msg = msg;
	}

	public FomException(String msg, int code, Throwable e) {
		super(msg, e);
		this.msg = msg;
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
}
