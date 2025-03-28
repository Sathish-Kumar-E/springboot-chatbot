package com.chatbot.dto;

public class Message {
	
	public String role;
	private String content;
	
	public Message() {
		super();
	}
	
	public Message(String role, String content) {
		super();
		this.role = role;
		this.content = content;
	}

	public String getContent() {
		return content;
	}
	
}
