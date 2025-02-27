package com.tarasovaanna.fortune.controllers;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {

    @MessageMapping("/request-status")
    @SendTo("/topic/request-status")
    public String updateRequestStatus(String requestId) {
        return requestId;
    }
}

