package com.epozen.epozenMall.controller;

import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Configuration
@EnableWebSocket
public class TestWebsocketConfigurer implements WebSocketConfigurer {

	private TextWebSocketHandler textWebSocketHandler = new TextWebSocketHandler() {
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
			log.info("MESSAGE RECEIVED: {}", message.getPayload());
			session.sendMessage(message);
		}
	};

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(textWebSocketHandler, "/sock-test");
	}

}
