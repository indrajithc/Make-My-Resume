package includes;

import java.sql.*;

 
public class Connection {

	public static final String DISPLAYNAME = "Project X";
	public static final String NAME = "ProjectX";
	public static final String PATH = "/" + NAME ;
	public static final String DIRECTORY = "http://localhost:8080" + PATH + "";
	
	//cust
	public static final String IN_DIRECTORY = "/home/indran/TOMCAT" + PATH + "/WebContent";
	public static final String UPLOAD_DIRECTORY = IN_DIRECTORY + "/upload";
	
	
	// <%= getServletConfig().getInitParameter("NAME") %>

	// Setting up variables
	private static final String myHost = "localhost";
	private static final String username = "projectX";
	private static final String password = "iPxSauhhxfpl9ot3";
	private static final String db = "projectX";

	private static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";

	public static String message = "";
	
	

	public static final String mailHost = "smtp.gmail.com";
	public static final String mailPort = "587";
	public static final String mailUser = "projectdemoxyz@gmail.com";
	public static final String mailPassword = "projectdemoxyz*"; 
	
 

	java.sql.Connection conn;
	public PreparedStatement preparedStatement;
	ResultSet rs;

	public Connection() {

		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("Driver found ");
		} catch (Exception e) {
			System.out.println("Driver not found ");
			message = e.getMessage();
			return;
		}

		try {
			String DB_URL = "jdbc:mariadb://" + myHost + "/" + db + "?autoReconnect=true&useUnicode=yes";
			//mysql://db_user:db_user@localhost/mydb?autoReconnect=true&useUnicode=yes
			Class.forName(JDBC_DRIVER);
			this.conn = (java.sql.Connection) DriverManager
					.getConnection(DB_URL, username, password);
			System.out.println("Connection ok ");
		} catch (Exception e) {
			System.out.println("Error for connection  error code :" + e);
			message = e.getMessage();
			return;
		}
	}

	public ResultSet display(String sql, Object[] values) {

		try {

			this.preparedStatement = (PreparedStatement) this.conn
					.prepareStatement(sql);

			int ind0000 = 0;
			for (Object value : values) {
				if (value == null) {
					this.preparedStatement
							.setNull(++ind0000, Integer.MIN_VALUE);
				} else {
					this.preparedStatement.setObject(++ind0000, value);
				}
			}

			this.rs = (ResultSet) this.preparedStatement.executeQuery();

			this.conn.close();
			// this.preparedStatement.close ();
			// this.rs.close();

		} catch (Exception e) {
			message = e.getMessage();
			System.out.println(message);
			// TODO: handle exception
		} finally {
			// try { this.rs.close(); } catch (Exception e) { /* ignored */ }
			// try { this.preparedStatement.close(); } catch (Exception e) { /*
			// ignored */ }
			try {
				this.conn.close();
			} catch (Exception e) {}
		}

		return this.rs;
	}
	
	public ResultSet display(String sql) {

		try {

			this.preparedStatement = (PreparedStatement) this.conn
					.prepareStatement(sql);

			 
			this.rs = (ResultSet) this.preparedStatement.executeQuery();

			this.conn.close();
			// this.preparedStatement.close ();
			// this.rs.close();

		} catch (Exception e) {
			message = e.getMessage();
			System.out.println(message);
			// TODO: handle exception
		} finally {
			// try { this.rs.close(); } catch (Exception e) { /* ignored */ }
			// try { this.preparedStatement.close(); } catch (Exception e) { /*
			// ignored */ }
			try {
				this.conn.close();
			} catch (Exception e) {}
		}

		return this.rs;
	}
	
	
	


	public int execute(String sql, Object[] values) {
		int reto = 0;
		try {

			this.preparedStatement = (PreparedStatement) this.conn
					.prepareStatement(sql);

			int ind0000 = 0;
			for (Object value : values) {
				if (value == null) {
					this.preparedStatement
							.setNull(++ind0000, Integer.MIN_VALUE);
				} else {
					this.preparedStatement.setObject(++ind0000, value);
				}
			}

			reto = this.preparedStatement.executeUpdate();
			this.conn.close();
			// this.preparedStatement.close ();
			// this.rs.close();

		} catch (Exception e) {
			message = e.getMessage();
			System.out.println(message);
			// TODO: handle exception
		} finally {
			// try { this.rs.close(); } catch (Exception e) { /* ignored */ }
			// try { this.preparedStatement.close(); } catch (Exception e) { /*
			// ignored */ }
			try {
				this.conn.close();
			} catch (Exception e) {}
		}

		return reto;
	}

	public int execute(String sql) {
		int reto = 0;
		try {

			this.preparedStatement = (PreparedStatement) this.conn
					.prepareStatement(sql); 
			
			reto = this.preparedStatement.executeUpdate();
			this.conn.close();


		} catch (Exception e) {
			message = e.getMessage();
			System.out.println(message);

		} finally {
			try {
				this.conn.close();
			} catch (Exception e) {}
		}

		return reto;
	}

}