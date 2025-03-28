package com.chatbot.dto;

import java.util.List;

public class ChatGptResponse {
	
	public static class Choice {
		private int index;
		private Message message;	
		public Choice() {
			super();
		}
		public Choice(int index, Message message) {
			super();
			this.index = index;
			this.message = message;
		}
		public Message getMessage() {
			return message;
		}
	}
	
	private List<Choice> choices;
	
	public List<Choice> getChoices() {
		return choices;
	}
	
}
