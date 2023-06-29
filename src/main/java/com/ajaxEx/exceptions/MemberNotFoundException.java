package com.ajaxEx.exceptions;

public class MemberNotFoundException extends RuntimeException {
	public MemberNotFoundException() {}
	
	public MemberNotFoundException(String msg) {
		super(msg);
	}
}
