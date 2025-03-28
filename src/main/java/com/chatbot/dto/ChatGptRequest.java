package com.chatbot.dto;

import java.util.List;
import java.util.ArrayList;

public class ChatGptRequest {
	
	private String model;
	private List<Message> messages;
	
	public ChatGptRequest() {
		super();
	}
	
	public ChatGptRequest(String model, String prompt) {
		super();
		this.model = model;
		this.messages = new ArrayList<>();
		this.messages.add(new Message("user", prompt));
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	
}
