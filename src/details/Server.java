package details;

import javax.servlet.http.HttpServletRequest;

public class Server {
	private String localAddr;
	private String localName;
	private String serverName;
	private String localPort;
	private String serverPort;
	private String contextPath;
	private String ServerProtocol;
	
	
	
	public void setServer (HttpServletRequest request) {
		this.localAddr = request.getLocalAddr();
		this.localName = request.getLocalName();
		this.serverName = request.getServerName();
		this.localPort = ""+request.getLocalPort();
		this.serverPort = ""+request.getServerPort();
		this.contextPath = request.getContextPath();
		this.ServerProtocol = request.getProtocol().replace("/1.1", "");
	}
	
	
	
	public String getLocalAddr() {
		return localAddr;
	} 
	public String getLocalName() {
		return localName;
	} 
	public String getServerName() {
		return serverName;
	} 
	public String getLocalPort() {
		return localPort;
	} 
	public String getServerPort() {
		return serverPort;
	} 
	public String getContextPath() {
		return contextPath;
	} 
	public String getServerProtocol() {
		return ServerProtocol;
	} 
	
	
	public boolean validate() {
		
		if (	localAddr == null ||
				localName == null ||
				serverName == null ||
				localPort == null ||
				serverPort == null ||
				contextPath == null ||
				ServerProtocol == null ) {
			
			return false;
			
		} else {
			return true;
		}
		
	}
	

}
