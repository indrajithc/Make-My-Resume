package email;
 
 
import includes.Connection;

public class GetEmail {
	
	
    private static String host = Connection.mailHost;
    private static String port = Connection.mailPort;
    private static String user = Connection.mailUser;
    private static String pass = Connection.mailPassword;
 
	
		public static int isMail( String recipient, String subject, String content) {
			int status = 0;
			 
	 
	        try {
	            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
	                    content);
	             System.out.println("The e-mail was sent successfully");
	             status = 1;
	        } catch (Exception ex) {
	        	status = 0;
	            ex.printStackTrace(); 
	             System.out.println("There were an error: " + ex.getMessage());
	        } finally {
	             
	        } 
			
			return status;			
		}

}
