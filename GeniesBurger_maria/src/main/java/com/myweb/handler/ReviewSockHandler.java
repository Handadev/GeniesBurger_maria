package com.myweb.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.myweb.domain.MemberVO;

public class ReviewSockHandler extends TextWebSocketHandler {
	private static Logger logger = LoggerFactory.getLogger(ReviewSockHandler.class);
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();

	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("서버 연결 : " + session);
		String senderId = getId(session);
		users.put(senderId, session);
		System.out.println(">>>>>>>>>>>" + users);
	}

	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지 전송 : " + session + " : " + message);
		String senderId = getId(session);
		System.out.println(senderId);
//			for (WebSocketSession ses : sessions) {
//				System.out.println(ses);
//				ses.sendMessage(new TextMessage(senderId + " : " + message.getPayload()));
//			}

		// protocol : cmd,관리자,리뷰작성자 (review,admin@admin.com,user@user.com)
		String msg = message.getPayload();
		System.out.println(">>>>내가보낸 메시지 <<<<<"+msg);
		if (StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if (strs != null) {
				String text = strs[0];
				String writer = strs[1];

				WebSocketSession writerSession = users.get(writer);
				System.out.println(">>>>>>>뭐냐 넌 도대체 <<<<<<<<<"+writerSession);
				if (writerSession != null) {
					TextMessage tmpMsg = new TextMessage(text);
					writerSession.sendMessage(tmpMsg);
				}
			}
		}
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO) httpSession.get("ses");
		String user = loginUser.getEmail();
		return user == null ? null : user;
	}

	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 해제  : " + session + " : " + status);
	}

	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("에러 : " + session + " : " + exception);
	}

}