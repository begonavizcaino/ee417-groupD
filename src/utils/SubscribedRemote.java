package utils;

import javax.websocket.RemoteEndpoint.Basic;

public class SubscribedRemote {
	private int subscribed;
	private Basic remote;
	
	public SubscribedRemote(Basic remote) {
		super();
		this.remote = remote;
	}

	public int getSubscribed() {
		return subscribed;
	}

	public void setSubscribed(int subscribed) {
		this.subscribed = subscribed;
	}

	public Basic getRemote() {
		return remote;
	}
}
