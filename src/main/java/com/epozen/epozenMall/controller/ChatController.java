package com.epozen.epozenMall.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.epozen.epozenMall.vo.Chat;

@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public String chat(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime",formattedDate);
		
		return "/chat/chat";
	}
	
	@MessageMapping("/chat")
	@SendTo("/topic/chat")
	public Chat chat(Chat chat) throws Exception {
		return new Chat(chat.getName(), chat.getMessage());
	}
	
	
}
