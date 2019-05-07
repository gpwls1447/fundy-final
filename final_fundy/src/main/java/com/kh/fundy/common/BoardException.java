package com.kh.fundy.common;

public class BoardException extends RuntimeException {

	private static final long serialVersionUID = -8260398773549493009L;

	public BoardException() {
		super();
	}
	
	public BoardException(String msg)
	{
		super(msg);
	}
}
