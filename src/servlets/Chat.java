package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;
import javax.websocket.CloseReason;
import javax.websocket.CloseReason.CloseCodes;
import javax.websocket.DeploymentException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import db.ConvMessage;
import db.Conversation;
import db.Database;
import db.User;
import utils.GetSession;
import utils.SubscribedRemote;
import utils.Utils;

@ServerEndpoint(value="/Chat", configurator= GetSession.class)
public class Chat  {
	static ArrayList<Basic> remotes = new ArrayList<Basic>();
	private User user;
	
	private static int PAST_MESSAGES_COUNT = 20;
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) throws IOException {
		HttpSession s = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		user = Utils.getUser(s);
		if(user == null) {
			session.close(new CloseReason(CloseCodes.CANNOT_ACCEPT, "Not connected!"));
			return;
		}
		Basic basicRemote = session.getBasicRemote();
		remotes.add(basicRemote);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws DeploymentException, IOException {
		Basic basicRemote = session.getBasicRemote();
		basicRemote.sendText("received");
		try {
			if(message.equals("startup")) {
				for(Conversation c : Database.conversationDao.findAll()) {
					ArrayList<ConvMessage> lastMessages = c.getLastMessages(PAST_MESSAGES_COUNT);
					Collections.reverse(lastMessages);
					for(ConvMessage m : lastMessages) {
						basicRemote.sendText("message;" + c.getId() + ";" + m.getUser().getName() + ";" + m.getMessage());
						System.out.println(m.getId());
					}
				}
			} else if(message.startsWith("message;")) {
				String[] messageParts = message.split(";");
				if(messageParts.length != 3) {
					basicRemote.sendText("wrong_parameter_count");
					return;
				}
				int convId = Integer.valueOf(messageParts[1]);
				Conversation c = Database.conversationDao.findOneById(convId);
				if(c == null) {
					basicRemote.sendText("wrong_conversation_id");
					return;
				}
				for(Basic b : remotes) {
					if(b != basicRemote)
						b.sendText("message;" + messageParts[1] + ";" + user.getName() + ";" + messageParts[2]);
				}
				ConvMessage m = new ConvMessage(messageParts[2], user.getId(), convId);
				Database.convMessageDao.insert(m);
			} else {
				basicRemote.sendText("unknown command");
			}
			/*for(Basic b : remotes) {
				if(b != basicRemote)
					b.sendText(message);
			}*/
		} catch (SQLException e) {
			e.printStackTrace();
			basicRemote.sendText("sql_error");
		}
	}
	
	@OnClose
	public void onClose(Session session, CloseReason closeReason) {
		Basic basicRemote = session.getBasicRemote();
		remotes.remove(basicRemote);
	}
}
