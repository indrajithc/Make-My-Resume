package operations;
 
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import details.User;

import java.sql.ResultSet;

public class Functions {
	
	/*	Map <String, Object> map_m =  new HashMap<String, Object>();

		map_m.put("username", email);
		map_m.put("password", password);
			
			Map <String, Object> map_m1 =  new HashMap<String, Object>();

			map_m1.put("username", email);
			map_m1.put("password", password);
			

			map_m.put("value", map_m1);
			map_m.put("success", 1);*/
	
	
	public static Map<String, Object> login( String email, String password, HttpServletRequest request, details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
			
			details.User user = new details.User();
			
			String query = " SELECT * FROM admin WHERE username = ? AND password = ? ";
			
			Object[] vo = new Object[2];
					vo[0] = email;
					vo[1] = password;
			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						boolean go =false;
						
						while(rs.next()) {
							user.setEmail(rs.getString("username"));
							user.setUserName(rs.getString("username"));
							user.setType("admin"); 					
							

							user.setImage(rs.getString("image"));
							user.setMobile(rs.getString("mobile"));
							user.setName(rs.getString("name"));
							go = true;
							//System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3) + "\n");
						}
						
						if (go) {
							HttpSession session = request.getSession();
							session.setAttribute("user", user);

							map_m.put("success", 1);
							
							if(!SERVER.validate())
								SERVER.setServer(request);
							String go_to_this = "" + SERVER.getServerProtocol() + "://"
									+ SERVER.getServerName() + ":"
									+ SERVER.getServerPort() + ""
									+ SERVER.getContextPath() + "/admin/"; 
							
 
							map_m.put("url", go_to_this);

						} else  {

							map_m.put("success", 0);
							map_m.put("error", 1);
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					

		return map_m;
	}
	
	
	
	
	
	
	
	
	/*===============================================================================================*/
	

	public static Map<String, Object> addCategory( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM category WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);

				con = new includes.Connection();
				 query = " UPDATE `category` SET `delete_status` = ? WHERE `name`= ?  ";
					
				 vo = new Object[2];
						vo[1] = name;
						vo[0] = 0;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}


				map_m.put("message", "category name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `category` ( `name`, `description` ) VALUES (?, ?); ";
			
			 vo = new Object[2];
					vo[0] = name;
					vo[1] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editCategory( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM category WHERE name = ? AND delete_status = 0  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "category name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `category` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteCategory( String name ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM category WHERE name = ? AND delete_status = 0 ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "category name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `category` SET `delete_status` = ? WHERE `name`= ?  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = 1;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*===============================================================================================*/
	
	
	
	
	
	
	/*=========================================== admin ========================================================*/
	


	public static Map<String, Object> updateAdmin( String name,String  email,String  mobile,String  landline,String   image ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
 
			String  query = " UPDATE admin SET name = ?, username = ?, mobile = ?, l_no = ?, image = ? WHERE id = 1";
			
			 Object[] vo = new Object[5];
					vo[0] = name;
					vo[1] = email;
					vo[2] = mobile;
					vo[3] = landline;
					vo[4] = image;
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	
	
	
	
	
	
	/*======================================================================================================*/
	

	
	
	/*===================================== start department==========================================================*/
	

	public static Map<String, Object> addDepartment( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM department WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				

				con = new includes.Connection();

				 query = " UPDATE `department` SET `delete_status` = ? WHERE `name`= ?  ";
					
				 vo = new Object[2];
						vo[1] = name;
						vo[0] = 0;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

						
						
						
				map_m.put("message", "department name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `department` ( `name`, `description` ) VALUES (?, ?); ";
			
			 vo = new Object[2];
					vo[0] = name;
					vo[1] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editDepartment( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM department WHERE name = ? AND delete_status = 0  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "department name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `department` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteDepartment( String name ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM department WHERE name = ? AND delete_status = 0 ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "department name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `department` SET `delete_status` = ? WHERE `name`= ?  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = 1;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*=========================================end department======================================================*/
	
	
/*===================================== start Job Category==========================================================*/
	

	public static Map<String, Object> addJobCategory( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM job_category WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `job_category` SET `delete_status` = ? WHERE `name`= ?  ";
					
				 vo = new Object[2];
						vo[1] = name;
						vo[0] = 0;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

						
				
				map_m.put("message", "job_category name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `job_category` ( `name`, `description` ) VALUES (?, ?); ";
			
			 vo = new Object[2];
					vo[0] = name;
					vo[1] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editJobCategory( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM job_category WHERE name = ? AND delete_status = 0  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "job_category name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `job_category` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteJobCategory( String name ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM job_category WHERE name = ? AND delete_status = 0 ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "job_category name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `job_category` SET `delete_status` = ? WHERE `name`= ?  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = 1;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*=========================================end JobCategory======================================================*/
	///*===================================== start Job ==========================================================*/
	

	public static Map<String, Object> addJob( String category,String department,String description,String purpose,String title ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM job WHERE category = ? AND title = ?  ";
			
			Object[] vo = new Object[2];
			vo[0] = category;
			vo[1] = title;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `job_category` SET `delete_status` = ? WHERE category = ? AND title = ?  ";
					

				vo = new Object[3];
					vo[0] = 0;
					vo[1] = category;
					vo[2] = title;

				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

						
				
				
				map_m.put("message", "job name `" + title + ""  + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `job` ( `category`, `title`, `department`, `purpose`, `description` ) VALUES (?, ?, ?, ?, ?); ";
			
			vo = new Object[5];
				vo[0] = category;
				vo[2] = department;
				vo[4] = description;
				vo[3] = purpose;
				vo[1] = title;

				
						
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
					
					map_m.put("vo", vo);

		return map_m;
	}
	
	

	public static Map<String, Object> editJob( String category,String department,String description,String purpose,String title ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM job WHERE category = ? AND title = ?  ";
			
			Object[] vo = new Object[2];
			vo[0] = category;
			vo[1] = title;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(!go){ 

				map_m.put("success", 2);
				map_m.put("message", "job_ name `" + title + "` no longer exist, reload the page! ");
				return map_m;
				
			}
			  
			con = new includes.Connection();
			 query = " UPDATE `job` SET  `category` = ? , `title` =? , `department` = ?, `purpose` = ? , `description` = ? WHERE  category = ? AND title = ?  ; ";
			
			vo = new Object[7];
				vo[0] = category;
				vo[2] = department;
				vo[4] = description;
				vo[3] = purpose;
				vo[1] = title;
				vo[5] = category;
				vo[6] = title;

				
						
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
					
					map_m.put("vo", vo);

		return map_m;
	}
	

	public static Map<String, Object> deleteJob( String category,String title ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM job WHERE category = ? AND title = ?  ";
			
			Object[] vo = new Object[2];
			vo[0] = category;
			vo[1] = title;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(!go){ 

				map_m.put("success", 2);
				map_m.put("message", "job_ name `" + title + "` no longer exist, reload the page! ");
				return map_m;
				
			}
			  
			con = new includes.Connection();
			 query = " UPDATE `job` SET  `delete_status` = ? WHERE  category = ? AND title = ?  ; ";
			
			vo = new Object[3];
				vo[0] = 1; 
				vo[1] = category;
				vo[2] = title;

				
						
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
					
					map_m.put("vo", vo);

		return map_m;
	}
	


	/*=========================================end Job======================================================*/
	//
	
	
/*===================================== start Language Category==========================================================*/
	

	public static Map<String, Object> addLanguageCategory( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM language_category WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `language_category` SET `delete_status` = ? WHERE `name`= ?  ";
					
				 vo = new Object[2];
						vo[1] = name;
						vo[0] = 0;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

				map_m.put("message", "language category name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `language_category` ( `name`, `description` ) VALUES (?, ?); ";
			
			 vo = new Object[2];
					vo[0] = name;
					vo[1] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editLanguageCategory( String name, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM language_category WHERE name = ? AND delete_status = 0  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "language_category name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `language_category` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteLanguageCategory( String name ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM language_category WHERE name = ? AND delete_status = 0 ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "language_category name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `language_category` SET `delete_status` = ? WHERE `name`= ?  ";
			
			 vo = new Object[2];
					vo[1] = name;
					vo[0] = 1;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*=========================================end LanguageCategory======================================================*/

	
/*===================================== start Language ==========================================================*/
	

	public static Map<String, Object> addLanguage( String name, String category, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM language WHERE name = ? AND category = ? ";
			
			Object[] vo = new Object[2];
			vo[0] = name;
			vo[1] = category;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `language` SET `delete_status` = ? WHERE `name`= ? AND category = ? ";
					
				 vo = new Object[3];
						vo[1] = name;
						vo[0] = 0;
						vo[2] = category;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

				map_m.put("message", "language name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `language` ( `name`, `category`, `description` ) VALUES (?, ?, ?); ";
			
			 vo = new Object[3];
					vo[0] = name;
					vo[1] = category;
					vo[2] = description;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editLanguage( String name,  String category, String description ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM language WHERE name = ? AND category = ? AND delete_status = 0  ";
			
			Object[] vo = new Object[2];
			vo[0] = name;
			vo[1] = category;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("success1", vo);
				map_m.put("message", "language name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `language` SET `description` = ?, category = ? WHERE `name`= ? AND category = ? AND delete_status = 0  ";
			
			 vo = new Object[4];
					vo[2] = name;
					vo[0] = description;
					vo[1] = category;
					vo[3] = category;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteLanguage( String name, String category ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 

			String query = " SELECT * FROM language WHERE name = ? AND category = ? AND delete_status = 0 ";
			
			Object[] vo = new Object[2];
				vo[0] = name;
				vo[1] = category;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "language name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `language` SET `delete_status` = ? WHERE `name`= ? AND category = ?   ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = 1;
					vo[2] = category;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}


	/*=========================================end LanguageCategory======================================================*/

	/*=========================================start in admin employer======================================================*/

	
	
	

	public static Map<String, Object> getEmployer( String id ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
 

			String query = " SELECT * FROM employer WHERE id = ? ";
			
			Object[] vo = new Object[1];
				vo[0] = id; 

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {

							map_m.put("success", 1);

							map_m.put("username", rs.getString("username"));
							map_m.put("company", rs.getString("company"));
							map_m.put("pin", rs.getString("pin"));
							map_m.put("country", rs.getString("country"));
							map_m.put("state", rs.getString("state"));
							map_m.put("contact", rs.getString("contact"));
							map_m.put("start_date", rs.getString("start_date"));
							map_m.put("vision", rs.getString("vision"));
							map_m.put("hr_contact", rs.getString("hr_contact"));
							map_m.put("url", rs.getString("url"));
							map_m.put("l_no", rs.getString("l_no"));
							map_m.put("mobile", rs.getString("mobile"));
							map_m.put("about", rs.getString("about"));
							map_m.put("image", rs.getString("image"));
							map_m.put("login", rs.getString("login"));
							map_m.put("delete_status", rs.getString("delete_status"));
							map_m.put("date", rs.getString("date"));

						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
		 
  

		return map_m;
	}
	public static Map<String, Object> activeEmployer( String id, String data ) {
		
		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);
 

		String query = " UPDATE `employer` SET `login` = ? WHERE id = ? AND delete_status = 0  ";
		
		Object[] vo = new Object[2]; 
				vo[0] = data;
				vo[1] = id;  
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						
						 query = " SELECT * FROM employer WHERE  id = ? ";
							
							vo = new Object[1]; 
							vo[0] = id;

							

							map_m.put("success", 1);

									try {

										con = new includes.Connection();
 
										ResultSet rs = (ResultSet) con.display(query , vo );
										 
										while(rs.next()) {
 
						 
						if(rs.getInt("login") == 1 ){

							map_m.put("success-3", 1);
						String code = UUID.randomUUID().toString();
						String username =  rs.getString("username");
						
						con = new includes.Connection();
						 query = " INSERT INTO `temp_verification` "+
						"(`email`, `type`, `user`, `code` ) VALUES "+
						"(?, ?, ?, ?); ";
				

						 vo = new Object[4];
								vo[0] = username;
								vo[1] = 2;
								vo[2] = "employer";
								vo[3] = code; 					
								
								try {
									result =   con.execute(query , vo );									

									if(result > 0) {
										int resultMail = toSomeOne( username, " Success ", "employer", code);
										
										if(resultMail == 0) {

											map_m.put("success", 0);
											map_m.put("code", code);
											
										} else 
											map_m.put("success", resultMail);
										
										 
										
									}

								} catch (Exception e) {
									System.out.println(e.getMessage());
									map_m.put("error", e.getMessage());
								}
								
									}
									}
								rs.close();
								
									} catch (Exception e) {
										System.out.println(e.getMessage());
										map_m.put("error", e.getMessage());
									}	
								
								
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

		
	 


	return map_m;
}
	
	
	

	/*=========================================end employer======================================================*/

/*================================================ starts skills =========================================*/
	public static Map<String, Object> editAdminSkills( String name, String description, HttpServletRequest request ) {
		
		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false; 


		HttpSession session = request.getSession();
		  User user = (User)  session.getAttribute("user");
		  

			  
			
			String query = " SELECT * FROM `admin` WHERE username='" + user.getEmail()+ "' ORDER BY date DESC ";

		 	int id =  0;  
					try {
						  ResultSet rs = ( ResultSet) con.display(query   );
						 
						while(rs.next()) {

						 	  id =  rs.getInt("id"); 
						}
						 
						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					
		
		
		if(id <1) { 

			map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
			return map_m;
		}
		
		

					 con = new includes.Connection();
					 
		
		
		
		  query = " SELECT * FROM skills WHERE name = ?   ";
		
		Object[] vo = new Object[1];
				vo[0] = name;

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {
						go = true;
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		
		if(!go){
			map_m.put("success", 2);
			map_m.put("message", "skills name `" + name + "` no longer exist, reload the page! ");
			return map_m;				
		}

		con = new includes.Connection();

		 query = " UPDATE `skills` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
		
		 vo = new Object[2];
				vo[1] = name;
				vo[0] = description; 
		
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						map_m.put("success", 1);
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}

public static Map<String, Object> deleteAdminSkills( String name, HttpServletRequest request ) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false; 
		
		

		HttpSession session = request.getSession();
		  User user = (User)  session.getAttribute("user");
		  

			  
			
			String query = " SELECT * FROM `admin` WHERE username='" + user.getEmail()+ "'   ORDER BY date DESC ";

		 	int id =  0;  
					try {
						  ResultSet rs = ( ResultSet) con.display(query   );
						 
						while(rs.next()) {

						 	  id =  rs.getInt("id"); 
						}
						 
						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					
		
		
		if(id <1) { 

			map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
			return map_m;
		}
		
		

					 con = new includes.Connection();
					

		  query = " SELECT * FROM skills WHERE name = ? AND delete_status = 0 ";
		
		Object[] vo = new Object[1];
		vo[0] = name; 

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {
						go = true;
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		
		if(!go){
			map_m.put("success", 2);
			map_m.put("message", "skills name `" + name + "` no longer exist, reload the page! ");
			return map_m;				
		}

		con = new includes.Connection();

		 query = " UPDATE `skills` SET `delete_status` = ? WHERE `name`= ?   ";
		
		 vo = new Object[2];
				vo[1] = name;
				vo[0] = 1; 
		
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						map_m.put("success", 1);
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}


/*=========================================end Skills======================================================*/





/*================================================ starts competencies =========================================*/
public static Map<String, Object> editAdminCompetencies( String name, String description, HttpServletRequest request ) {
	
	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 


	HttpSession session = request.getSession();
	  User user = (User)  session.getAttribute("user");
	  

		  
		
		String query = " SELECT * FROM `admin` WHERE username='" + user.getEmail()+ "' ORDER BY date DESC ";

	 	int id =  0;  
				try {
					  ResultSet rs = ( ResultSet) con.display(query   );
					 
					while(rs.next()) {

					 	  id =  rs.getInt("id"); 
					}
					 
					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
	
	
	if(id <1) { 

		map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
		return map_m;
	}
	
	

				 con = new includes.Connection();
				 
	
	
	
	  query = " SELECT * FROM competencies WHERE name = ?   ";
	
	Object[] vo = new Object[1];
			vo[0] = name;

	
			
			try {
				ResultSet rs = (ResultSet) con.display(query , vo );
				
				
				while(rs.next()) {
					go = true;
				}

				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}
	
	if(!go){
		map_m.put("success", 2);
		map_m.put("message", "competencies name `" + name + "` no longer exist, reload the page! ");
		return map_m;				
	}

	con = new includes.Connection();

	 query = " UPDATE `competencies` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
	
	 vo = new Object[2];
			vo[1] = name;
			vo[0] = description; 
	
			
			try {
				int result =   con.execute(query , vo );

				if(result != 0){
					map_m.put("success", 1);
				}



				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}

return map_m;
}

public static Map<String, Object> deleteAdminCompetencies( String name, HttpServletRequest request ) {

	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	
	

	HttpSession session = request.getSession();
	  User user = (User)  session.getAttribute("user");
	  

		  
		
		String query = " SELECT * FROM `admin` WHERE username='" + user.getEmail()+ "'   ORDER BY date DESC ";

	 	int id =  0;  
				try {
					  ResultSet rs = ( ResultSet) con.display(query   );
					 
					while(rs.next()) {

					 	  id =  rs.getInt("id"); 
					}
					 
					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
	
	
	if(id <1) { 

		map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
		return map_m;
	}
	
	

				 con = new includes.Connection();
				

	  query = " SELECT * FROM competencies WHERE name = ? AND delete_status = 0 ";
	
	Object[] vo = new Object[1];
	vo[0] = name; 

	
			
			try {
				ResultSet rs = (ResultSet) con.display(query , vo );
				
				
				while(rs.next()) {
					go = true;
				}

				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}
	
	if(!go){
		map_m.put("success", 2);
		map_m.put("message", "competencies name `" + name + "` no longer exist, reload the page! ");
		return map_m;				
	}

	con = new includes.Connection();

	 query = " UPDATE `competencies` SET `delete_status` = ? WHERE `name`= ?   ";
	
	 vo = new Object[2];
			vo[1] = name;
			vo[0] = 1; 
	
			
			try {
				int result =   con.execute(query , vo );

				if(result != 0){
					map_m.put("success", 1);
				}



				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}

return map_m;
}


/*=========================================end competencies======================================================*/




/*================================================ starts education =========================================*/
public static Map<String, Object> editAdminEducation( String name, String description, HttpServletRequest request ) {
	
	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 


	HttpSession session = request.getSession();
	  User user = (User)  session.getAttribute("user");
	  

		  
		
		String query = " SELECT * FROM `admin` WHERE username='" + user.getEmail()+ "' ORDER BY date DESC ";

	 	int id =  0;  
				try {
					  ResultSet rs = ( ResultSet) con.display(query   );
					 
					while(rs.next()) {

					 	  id =  rs.getInt("id"); 
					}
					 
					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
	
	
	if(id <1) { 

		map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
		return map_m;
	}
	
	

				 con = new includes.Connection();
				 
	
	
	
	  query = " SELECT * FROM education WHERE name = ?   ";
	
	Object[] vo = new Object[1];
			vo[0] = name;

	
			
			try {
				ResultSet rs = (ResultSet) con.display(query , vo );
				
				
				while(rs.next()) {
					go = true;
				}

				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}
	
	if(!go){
		map_m.put("success", 2);
		map_m.put("message", "education name `" + name + "` no longer exist, reload the page! ");
		return map_m;				
	}

	con = new includes.Connection();

	 query = " UPDATE `education` SET `description` = ? WHERE `name`= ? AND delete_status = 0  ";
	
	 vo = new Object[2];
			vo[1] = name;
			vo[0] = description; 
	
			
			try {
				int result =   con.execute(query , vo );

				if(result != 0){
					map_m.put("success", 1);
				}



				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}

return map_m;
}

public static Map<String, Object> deleteAdminEducation( String name, HttpServletRequest request ) {

	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	
	

	HttpSession session = request.getSession();
	  User user = (User)  session.getAttribute("user");
	  

		  
		
		String query = " SELECT * FROM `admin` WHERE username='" + user.getEmail()+ "'   ORDER BY date DESC ";

	 	int id =  0;  
				try {
					  ResultSet rs = ( ResultSet) con.display(query   );
					 
					while(rs.next()) {

					 	  id =  rs.getInt("id"); 
					}
					 
					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
	
	
	if(id <1) { 

		map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
		return map_m;
	}
	
	

				 con = new includes.Connection();
				

	  query = " SELECT * FROM education WHERE name = ? AND delete_status = 0 ";
	
	Object[] vo = new Object[1];
	vo[0] = name; 

	
			
			try {
				ResultSet rs = (ResultSet) con.display(query , vo );
				
				
				while(rs.next()) {
					go = true;
				}

				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}
	
	if(!go){
		map_m.put("success", 2);
		map_m.put("message", "education name `" + name + "` no longer exist, reload the page! ");
		return map_m;				
	}

	con = new includes.Connection();

	 query = " UPDATE `education` SET `delete_status` = ? WHERE `name`= ?   ";
	
	 vo = new Object[2];
			vo[1] = name;
			vo[0] = 1; 
	
			
			try {
				int result =   con.execute(query , vo );

				if(result != 0){
					map_m.put("success", 1);
				}



				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			}

return map_m;
}


/*=========================================end education======================================================*/


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/*====================================================================================*/
	/*======================================employer=====================================*/
	/*====================================================================================*/



	
	
	

	public static Map<String, Object> employerRegister
	(String company,String  pin,String  country,String  state,String  username, String mobile, String  password,  HttpServletRequest request,  details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM employer WHERE username = ?  ";
			
			Object[] vo = new Object[1];
			vo[0] = username;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);  
				map_m.put("message", " email already exists");
				return map_m;				
			}
			go =false; 


			con = new includes.Connection();
			  query = " SELECT * FROM employer WHERE  mobile = ? ";
			
			vo = new Object[1]; 
			vo[0] = mobile;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 3);  
				map_m.put("message", "  mobile already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `employer` (`username`, `company`, `pin`, `country`, `state`, `mobile`, `password` ) VALUES "+
					 							"(?, ?, ?, ?, ?, ?, ?); ";
	
			 // ,  ,   ,  ,  , ,  password
			 vo = new Object[7];
					vo[0] = username;
					vo[1] = company;
					vo[2] = pin;
					vo[3] = country;
					vo[4] = state;
					vo[5] = mobile;
					vo[6] = password; 
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							

							map_m.put("success", 1);
							

							if(!SERVER.validate())
								SERVER.setServer(request);
							String go_to_this = "" + SERVER.getServerProtocol() + "://"
									+ SERVER.getServerName() + ":"
									+ SERVER.getServerPort() + ""
									+ SERVER.getContextPath() + "/employerConfirmpage"; 
							
 
							map_m.put("url", go_to_this);
							 
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	
	
	
	
	public static Map<String, Object> employerLogin( String email, String password, HttpServletRequest request, details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
			
			details.User user = new details.User();
			
			String query = " SELECT * FROM employer WHERE username = ? AND password = ? AND login = 1 AND delete_status = 0 ";
			
			Object[] vo = new Object[2];
					vo[0] = email;
					vo[1] = password;
					map_m.put("success-1", vo);
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						boolean go =false;
						
						while(rs.next()) {
							user.setEmail(rs.getString("username"));
							user.setUserName(rs.getString("username"));
							user.setType("employer"); 					
							

							user.setImage(rs.getString("image"));
							user.setMobile(rs.getString("mobile"));
							user.setName(rs.getString("company"));
							go = true;
							//System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3) + "\n");
						}
						
						if (go) {
							HttpSession session = request.getSession();
							session.setAttribute("user", user);

							map_m.put("success", 1);
							
							if(!SERVER.validate())
								SERVER.setServer(request);
							String go_to_this = "" + SERVER.getServerProtocol() + "://"
									+ SERVER.getServerName() + ":"
									+ SERVER.getServerPort() + ""
									+ SERVER.getContextPath() + "/employer/"; 
							
 
							map_m.put("url", go_to_this);

						} else  {

							map_m.put("success", 0);
							map_m.put("error", 1);
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					

		return map_m;
	}
	
	
 
	
	
	
	public static Map<String, Object> employerUpdate
	(String id, String company,String  pin,String  country,String  state,String  username, String mobile, String   contact,
			String start_date, String vision,String  hr_contact,String  url,String  l_no,String  about,String  image,   HttpServletRequest request,  details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			HttpSession httpSession = request.getSession();
			User user = (User)  httpSession.getAttribute("user");
			
			if(user == null) {
				map_m.put("success", -1);  
				map_m.put("message", "login first");
				return map_m;	
			} 
			 
			boolean go =false; 
			
			
			if(!user.getEmail().equals(username)) {

				String query = " SELECT * FROM employer WHERE username = ?  ";
				
				Object[] vo = new Object[1];
				vo[0] = username;

				
						
						try {
							ResultSet rs = (ResultSet) con.display(query , vo );
							
							
							while(rs.next()) {
								go = true;
							}

							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 
				
				
				if(go){
					map_m.put("success", 2);  
					map_m.put("message", " email already exists");
					return map_m;				
				}
				
			}


			go =false; 
 
			if(!user.getMobile().equals(mobile)) {
				
				con = new includes.Connection();
				  String query = " SELECT * FROM employer WHERE  mobile = ? ";
				
				  Object[] vo = new Object[1]; 
				vo[0] = mobile;

				
						
						try {
							ResultSet rs = (ResultSet) con.display(query , vo );
							
							
							while(rs.next()) {
								go = true;
							}

							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 
				
				
				if(go){
					map_m.put("success", 3);  
					map_m.put("message", "  mobile already exists");
					return map_m;				
				}
				
			}
			

			  
			con = new includes.Connection();
			 String query = " UPDATE  `employer` SET "+
			"`username`= ? ,`company`=? ,`pin`=? ,`country`=? ,`state`=?,`contact`=?, "+
			"`start_date`= ? ,`vision`=? ,`hr_contact`=?,`url`=?,`l_no`=?,`mobile`=?,`about`=?,`image`=? "+
					 							" WHERE id= ? ";
	
			 // ,  ,   ,  ,  , ,  password
			 Object[] vo = new Object[15];
					vo[0] = username;
					vo[1] = company;
					vo[2] = pin;
					vo[3] = country;
					vo[4] = state;
					vo[5] = contact;
					vo[6] = start_date; 
					vo[7] = vision; 
					vo[8] = hr_contact; 
					vo[9] = url; 
					vo[10] = l_no; 
					vo[11] = mobile; 
					vo[12] = about; 
					vo[13] = image; 
					vo[14] = id;  
					
					map_m.put("success", vo);
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							user.setEmail(username);
							user.setUserName(username); 				
							

							user.setImage(image);
							user.setMobile(mobile);
							user.setName(company);
							
							map_m.put("success", 1);
							
							 
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	
	/*===========================================end update =========================================*/
	
	
	

/*===================================== start Skills==========================================================*/
	

	public static Map<String, Object> addSkills( String name, String description , HttpServletRequest request) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			
			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
						 
			  query = " SELECT * FROM skills WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `skills` SET `delete_status` = ? WHERE `name`= ? AND employer=? ";
					
				 vo = new Object[3];
						vo[1] = name;
						vo[0] = 0;
						vo[2] = id;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

				map_m.put("message", "skills name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `skills` ( `name`, `description` , `employer`) VALUES (?, ?, ?); ";
			
			 vo = new Object[3];
					vo[0] = name;
					vo[1] = description;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editSkills( String name, String description, HttpServletRequest request ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
			
			
			
			  query = " SELECT * FROM skills WHERE name = ? AND delete_status = 0 AND employer = ? ";
			
			Object[] vo = new Object[2];
					vo[0] = name;
					vo[1] = id;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "skills name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `skills` SET `description` = ? WHERE `name`= ? AND delete_status = 0 AND employer = ?  ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = description;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteSkills( String name, HttpServletRequest request ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			

			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						

			  query = " SELECT * FROM skills WHERE name = ? AND delete_status = 0 AND employer =?";
			
			Object[] vo = new Object[2];
			vo[0] = name;
			vo[1] = id;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "skills name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `skills` SET `delete_status` = ? WHERE `name`= ? AND employer=? ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = 1;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*=========================================end Skills======================================================*/

	


/*===================================== start competencies==========================================================*/
	

	public static Map<String, Object> addCompetencies( String name, String description , HttpServletRequest request) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			
			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
						 
			  query = " SELECT * FROM competencies WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `competencies` SET `delete_status` = ? WHERE `name`= ? AND employer=? ";
					
				 vo = new Object[3];
						vo[1] = name;
						vo[0] = 0;
						vo[2] = id;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

				map_m.put("message", "competencies name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `competencies` ( `name`, `description` , `employer`) VALUES (?, ?, ?); ";
			
			 vo = new Object[3];
					vo[0] = name;
					vo[1] = description;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editCompetencies( String name, String description, HttpServletRequest request ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
			
			
			
			  query = " SELECT * FROM competencies WHERE name = ? AND delete_status = 0 AND employer = ? ";
			
			Object[] vo = new Object[2];
					vo[0] = name;
					vo[1] = id;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "competencies name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `competencies` SET `description` = ? WHERE `name`= ? AND delete_status = 0 AND employer = ?  ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = description;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteCompetencies( String name, HttpServletRequest request ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			

			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						

			  query = " SELECT * FROM competencies WHERE name = ? AND delete_status = 0 AND employer =?";
			
			Object[] vo = new Object[2];
			vo[0] = name;
			vo[1] = id;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "competencies name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `competencies` SET `delete_status` = ? WHERE `name`= ? AND employer=? ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = 1;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*=========================================end competencies======================================================*/

	


/*===================================== start education==========================================================*/
	

	public static Map<String, Object> addEducation( String name, String description , HttpServletRequest request) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			
			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
						 
			  query = " SELECT * FROM education WHERE name = ?  ";
			
			Object[] vo = new Object[1];
					vo[0] = name;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				

				con = new includes.Connection();

				 query = " UPDATE `education` SET `delete_status` = ? WHERE `name`= ? AND employer=? ";
					
				 vo = new Object[3];
						vo[1] = name;
						vo[0] = 0;
						vo[2] = id;
				
						
						try {
							int result =   con.execute(query , vo );

							if(result != 0){
								map_m.put("success", 1);
							} 
								
							}catch (Exception e) {
								System.out.println(e.getMessage());
								map_m.put("error", e.getMessage());
							}

				map_m.put("message", "education name `" + name + "` already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `education` ( `name`, `description` , `employer`) VALUES (?, ?, ?); ";
			
			 vo = new Object[3];
					vo[0] = name;
					vo[1] = description;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> editEducation( String name, String description, HttpServletRequest request ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
			
			
			
			  query = " SELECT * FROM education WHERE name = ? AND delete_status = 0 AND employer = ? ";
			
			Object[] vo = new Object[2];
					vo[0] = name;
					vo[1] = id;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "education name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `education` SET `description` = ? WHERE `name`= ? AND delete_status = 0 AND employer = ?  ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = description;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	public static Map<String, Object> deleteEducation( String name, HttpServletRequest request ) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			

			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						

			  query = " SELECT * FROM education WHERE name = ? AND delete_status = 0 AND employer =?";
			
			Object[] vo = new Object[2];
			vo[0] = name;
			vo[1] = id;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}
			
			if(!go){
				map_m.put("success", 2);
				map_m.put("message", "education name `" + name + "` no longer exist, reload the page! ");
				return map_m;				
			}
 
			con = new includes.Connection();
	
			 query = " UPDATE `education` SET `delete_status` = ? WHERE `name`= ? AND employer=? ";
			
			 vo = new Object[3];
					vo[1] = name;
					vo[0] = 1;
					vo[2] = id;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}

	
	/*=========================================end education======================================================*/
	/*=========================================start vacancy======================================================*/

	public static Map<String, Object> getJob( String category ) {
		
		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

	 

		String query = " SELECT * FROM job WHERE category = ? AND delete_status = 0 ";
		
		Object[] vo = new Object[1];
			vo[0] = category; 

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );

					Map <String, Object> map_c =  new HashMap<String, Object>();
					int cou = 0;
					while(rs.next()) {
						
						map_m.put("success", 1);

						Map <String, Object> map_b =  new HashMap<String, Object>();
						
						map_b.put("id", rs.getString("id"));
						map_b.put("title", rs.getString("title"));
						map_b.put("department", rs.getString("department"));
						map_b.put("purpose", rs.getString("purpose"));
						map_b.put("description", rs.getString("description"));

						map_c.put(cou+"", map_b);
						cou++;
						
					}
					map_m.put("data", map_c);

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		
	 


	return map_m;
}

	
	
	
	

	public static Map<String, Object> addVacancies( String job, String  place, String  salary, String  hours
			, String  education, String  skills, String  competencies, String  experience,
			 String qualifications, String  description, String interview, HttpServletRequest request) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 
			
			
			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

						 con = new includes.Connection();
						 
						 
			  query = " SELECT * FROM vacancies WHERE job = ? AND employer = ? AND place = ? AND salary = ? AND interview = ?";
			
			Object[] vo = new Object[5];
			vo[0] = job;
			vo[1] = id;
			vo[2] = place;
			vo[3] = salary;
			vo[4] = interview;


			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);
				
				 
				map_m.put("message", "vacancies  already exists");
				return map_m;				
			}
			  
			con = new includes.Connection();
			 query = " INSERT INTO `vacancies` ( "+
					 "job, employer, place, salary, hours, education, skills, competencies, experience,"+
					 "qualifications, description,interview) VALUES ("+
					 "?,?,?,?,?,?,?,?,?,?,?,?); ";
			
			 vo = new Object[12];
					vo[0] = job;
					vo[1] = id;
					vo[2] = place;
					vo[3] = salary;
					vo[4] = hours;
					vo[5] = education;
					vo[6] = skills;
					vo[7] = competencies;
					vo[8] = experience;
					vo[9] = qualifications;
					vo[10] = description;
					vo[11] = interview;
			
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);

							 con = new includes.Connection();
							 
							 
				  query = " SELECT * FROM vacancies WHERE job = ? AND employer = ? AND place = ? AND salary = ? AND interview = ? ORDER BY date DESC limit 1";
				
				  vo = new Object[5];
						vo[0] = job;
						vo[1] = id;
						vo[2] = place;
						vo[3] = salary;
						vo[4] = interview; 
						
						try {
							ResultSet rs = (ResultSet) con.display(query , vo );
							
							
							while(rs.next()) {
								map_m.put("id", rs.getString("id"));
							}

							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 
							
							
							
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	
	
	

	public static Map<String, Object> getVacancies( String id ) {
		
		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

	 

		String query = " SELECT * FROM vacancies WHERE id = ? AND delete_status = 0 ";
		
		Object[] vo = new Object[1];
			vo[0] = id; 

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );

					while(rs.next()) {
						
						map_m.put("success", 1);

						 
						map_m.put("id", rs.getString("id"));
						map_m.put("job", rs.getString("job"));
						map_m.put("place", rs.getString("place"));
						map_m.put("salary", rs.getString("salary"));
						map_m.put("hours", rs.getString("hours"));
						map_m.put("education", rs.getString("education"));
						map_m.put("skills", rs.getString("skills"));
						map_m.put("competencies", rs.getString("competencies"));
						map_m.put("experience", rs.getString("experience"));
						map_m.put("qualifications", rs.getString("qualifications"));
						map_m.put("description", rs.getString("description"));
						map_m.put("interview", rs.getString("interview"));
						map_m.put("date", rs.getString("date")); 

						 
						
						
						 con = new includes.Connection();
						 
									 
						  query = " SELECT * FROM job WHERE id = ? ";
						
						  vo = new Object[1];
								vo[0] =  rs.getString("job");
								
								try {
									  ResultSet resultSet  = (ResultSet) con.display(query , vo );
									
									
									while(resultSet.next()) {
										map_m.put("job_category", resultSet.getString("category"));
									}
			
									resultSet.close();
									con.preparedStatement.close (); 
									
								} catch (Exception e) {
									System.out.println(e.getMessage());
									map_m.put("error", e.getMessage());
								} 
									
						
					}
					 
					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		
	 


	return map_m;
}

	


	public static Map<String, Object> editVacancies( String idd, String job, String  place, String  salary, String  hours
			, String  education, String  skills, String  competencies, String  experience,
			 String qualifications, String  description, String interview, HttpServletRequest request) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
 
			HttpSession session = request.getSession();
			  User user = (User)  session.getAttribute("user");
			  

				  
				
				String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

			 	int id =  0;  
						try {
							  ResultSet rs = ( ResultSet) con.display(query   );
							 
							while(rs.next()) {

							 	  id =  rs.getInt("id"); 
							}
							 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
						
			
			
			if(id <1) { 

				map_m.put("message", "EMPLOYER NOT AUTHENTICATED !");
				return map_m;
			}
			
			

				 
			  
			con = new includes.Connection();
			 query = " UPDATE `vacancies` SET "+
					 "job = ?, employer = ?, place = ?, salary = ?, hours = ?, education = ?, skills = ?,"+
					 "competencies = ?, experience = ?,qualifications = ?, description = ?,interview = ? "+
					 " WHERE id= ?; ";
			
			 Object[] vo = new Object[13];
					vo[0] = job;
					vo[1] = id;
					vo[2] = place;
					vo[3] = salary;
					vo[4] = hours;
					vo[5] = education;
					vo[6] = skills;
					vo[7] = competencies;
					vo[8] = experience;
					vo[9] = qualifications;
					vo[10] = description;
					vo[11] = interview;
					vo[12] = idd;
 
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1); 
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	

	public static Map<String, Object> deleteVacancies( String idd) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
 
			 
  
			 String query = " UPDATE `vacancies` SET "+
					 "delete_status = ?  "+
					 " WHERE id= ?; ";
			
			 Object[] vo = new Object[2];
					vo[0] = 1;
					vo[1] = idd; 
 
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1); 
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	
	
	
	/*=========================================end vacancy======================================================*/

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	/*====================================================================================*/
	/*======================================employee=====================================*/
	/*====================================================================================*/



	
	
	

	public static Map<String, Object> employeeRegister
	(String fname,String  lname, String  username, String  password,  HttpServletRequest request,  details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			boolean go =false; 


			String query = " SELECT * FROM employee WHERE username = ?  ";
			
			Object[] vo = new Object[1];
			vo[0] = username;

			
					
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						
						while(rs.next()) {
							go = true;
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					} 
			
			
			if(go){
				map_m.put("success", 2);  
				map_m.put("message", " email already exists");
				return map_m;				
			}
			 
			 
			con = new includes.Connection();
			 query = " INSERT INTO `employee` (`username`, `fname`, `lname`, `password` ) VALUES "+
					 							"(?, ?, ?, ?); ";
 
			 vo = new Object[4];
					vo[0] = username;
					vo[1] = fname;
					vo[2] = lname;
					vo[3] = password; 
			
					
					
						try {
							if(!SERVER.validate())
								SERVER.setServer(request);
							String go_to_this = "" + SERVER.getServerProtocol() + "://"
									+ SERVER.getServerName() + ":"
									+ SERVER.getServerPort() + ""
									+ SERVER.getContextPath() + "/employeeConfirmpage"; 
							

							map_m.put("url", go_to_this);
							 
						} catch (Exception e) {
							// TODO: handle exception
						}
					
					
					
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							

							map_m.put("success", 1);
							
							
							
							 

								map_m.put("success-3", 1);
							String code = UUID.randomUUID().toString();
							 
							con = new includes.Connection();
							 query = " INSERT INTO `temp_verification` "+
							"(`email`, `type`, `user`, `code` ) VALUES "+
							"(?, ?, ?, ?); ";
					

							 vo = new Object[4];
									vo[0] = username;
									vo[1] = 2;
									vo[2] = "employee";
									vo[3] = code; 					
									
									try {
										result =   con.execute(query , vo );									

										if(result > 0) {
											int resultMail = toSomeOne( username, " Success ", "employee", code);
											
											if(resultMail == 0) {

												map_m.put("success", 0);
												map_m.put("code", code);
												
											} else 
												map_m.put("success", resultMail);
											
											 
											
										}

									} catch (Exception e) {
										System.out.println(e.getMessage());
										map_m.put("error", e.getMessage());
									}
									
									 
							
							
							

						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	
	
	
	
	public static Map<String, Object> employeeLogin( String email, String password, HttpServletRequest request, details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);
			
			details.User user = new details.User();
			
			
			try {

				if(!SERVER.validate())
					SERVER.setServer(request);
				String go_to_this = "" + SERVER.getServerProtocol() + "://"
						+ SERVER.getServerName() + ":"
						+ SERVER.getServerPort() + ""
						+ SERVER.getContextPath() + "/employee/"; 
				

				map_m.put("url", go_to_this);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			String query = " SELECT * FROM employee WHERE username = ? AND password = ? AND login = 1 AND delete_status= 0 ";
			
			Object[] vo = new Object[2];
					vo[0] = email;
					vo[1] = password; 
 	 
					try {
						ResultSet rs = (ResultSet) con.display(query , vo );
						
						boolean go =false;
						
						while(rs.next()) {

							user.setEmail(rs.getString("username")); 
							user.setUserName(rs.getString("username")); 
							user.setType("employee"); 				 
							
							
							user.setImage(rs.getString("image"));
							user.setMobile(rs.getString("mobile"));
							user.setName(rs.getString("fname") + " " + rs.getString("lname"));
							go = true;
							//System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3) + "\n");
						}
						
						if (go) {
							HttpSession session = request.getSession();
							session.setAttribute("user", user);

							map_m.put("success", 1);
							

						} else  {

							map_m.put("success", 0);
							map_m.put("error", 1);
						}

						rs.close();
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					

		return map_m;
	}
	
	
 
	
	
	
	public static Map<String, Object> employeeUpdate
	(String id,String  fname,String  lname,String  username,String  mobile,String  address,String  l_no,String  sex,String  image, HttpServletRequest request,  details.Server SERVER) {
	
			includes.Connection con = new includes.Connection();
			
			Map <String, Object> map_m =  new HashMap<String, Object>();
			map_m.put("success", 0);

			HttpSession httpSession = request.getSession();
			User user = (User)  httpSession.getAttribute("user");
			
			if(user == null) {
				map_m.put("success", -1);  
				map_m.put("message", "login first");
				return map_m;	
			} 
			 
			boolean go =false; 
			
			
			if(!user.getEmail().equals(username)) {

				String query = " SELECT * FROM employee WHERE username = ?  ";
				
				Object[] vo = new Object[1];
				vo[0] = username;

				
						
						try {
							ResultSet rs = (ResultSet) con.display(query , vo );
							
							
							while(rs.next()) {
								go = true;
							}

							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 
				
				
				if(go){
					map_m.put("success", 2);  
					map_m.put("message", " email already exists");
					return map_m;				
				}
				
			}


			go =false; 
 
			if(user.getMobile() != null )
				if(!user.getMobile().equals(mobile)) {
				
				con = new includes.Connection();
				  String query = " SELECT * FROM employee WHERE  mobile = ? ";
				
				  Object[] vo = new Object[1]; 
				vo[0] = mobile;

				
						
						try {
							ResultSet rs = (ResultSet) con.display(query , vo );
							
							
							while(rs.next()) {
								go = true;
							}

							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 
				
				
				if(go){
					map_m.put("success", 3);  
					map_m.put("message", "  mobile already exists");
					return map_m;				
				}
				
			}
			

			  
			con = new includes.Connection();
			 String query = " UPDATE  `employee` SET "+
			"`username`= ? ,`fname`=? ,`lname`=?,`address`=?, "+
			"`sex`= ? ,`l_no`=?,`mobile`=?,`image`=? "+
					 							" WHERE id= ? ";
	
			 // ,  ,   ,  ,  , ,  password
			 Object[] vo = new Object[9];
					vo[0] = username;
					vo[1] = fname;
					vo[2] = lname;
					vo[3] = address;
					vo[4] = sex;
					vo[5] = l_no;
					vo[6] = mobile; 
					vo[7] = image; 
					vo[8] = id;  
					
					map_m.put("success", vo);
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							user.setEmail(username);
							user.setUserName(username); 				
							

							user.setImage(image);
							user.setMobile(mobile);
							user.setName(fname + " " + lname);
							
							map_m.put("success", 1);
							
							 
						}
					 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

		return map_m;
	}
	
	/*===========================================end update =========================================*/
	
	
public static Map<String, Object> getLanguage( String id ) {
		
		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

	 

		String query = " SELECT * FROM language WHERE category = ? AND delete_status = 0 ";
		
		Object[] vo = new Object[1];
			vo[0] = id; 

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );

					Map <String, Object> map_c =  new HashMap<String, Object>();
					int cou = 0;
					while(rs.next()) {
						
						map_m.put("success", 1);

						Map <String, Object> map_b =  new HashMap<String, Object>();
						
						map_b.put("id", rs.getString("id"));
						map_b.put("name", rs.getString("name"));
						map_b.put("description", rs.getString("description")); 

						map_c.put(cou+"", map_b);
						cou++;
						
					}
					map_m.put("data", map_c);

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		
	 


	return map_m;
}

public static Map<String, Object> setLanguage( String id, String status , HttpServletRequest request) {
	
	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	String idd = "0";
		HttpSession session = request.getSession();
		User user = (User)  session.getAttribute("user");
	  

	String query = " SELECT * FROM employee WHERE username = ?  ";
	
	Object[] vo = new Object[1];
	vo[0] = user.getUserName();

	
			
			try {
				ResultSet rs = (ResultSet) con.display(query , vo ); 
				while(rs.next()) {
					idd = rs.getString("id");
				} 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			} 
	
	
	
			go =false;  
			if(Integer.parseInt(status) == 1) {	
				con = new includes.Connection();
				    query = " SELECT * FROM interested WHERE  employee = ? AND language = ?  ";
				
				    vo = new Object[2];
					vo[1] = id;
					vo[0] = idd; 

				
						
						try {
							ResultSet rs = (ResultSet) con.display(query , vo );
							
							
							while(rs.next()) {
								go = true;
							}

							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 
				
				
				if(go){
					map_m.put("success", 0);  
					map_m.put("message", "   already exists");
					return map_m;				
				}
				
			}

			con = new includes.Connection();
			
			if(Integer.parseInt(status) == 1) {
	
			 query = " INSERT INTO interested (employee,	language ) VALUES (?, ?) ";
			 
			 vo = new Object[2];
					vo[1] = id;
					vo[0] = idd; 
			} else {
				query = " UPDATE interested SET delete_status= 1 WHERE employee = ? AND language = ? ";
				 
				 vo = new Object[2];
						vo[1] = id;
						vo[0] = idd;  
			}
					
					try {
						int result =   con.execute(query , vo );

						if(result != 0){
							map_m.put("success", 1);
						}

 
 
						con.preparedStatement.close (); 
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
						map_m.put("error", e.getMessage());
					}

	
 
	
 


return map_m;
}




public static Map<String, Object> toAdmin
(String adminId,String  subject, String  description, HttpServletRequest request) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

 
		String idd = "0";
		HttpSession session = request.getSession();
		User user = (User)  session.getAttribute("user");
	  

		String query = " SELECT * FROM employee WHERE username = ?  ";
		
		Object[] vo = new Object[1];
		vo[0] = user.getUserName();
		
				

		try {
			ResultSet rs = (ResultSet) con.display(query , vo ); 
			while(rs.next()) {
				idd = rs.getString("id");
			} 
			rs.close();
			con.preparedStatement.close (); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			map_m.put("error", e.getMessage());
		} 

		
		 
		 
		 
		con = new includes.Connection();
		 query = " INSERT INTO `say_to_admin` (`admin`, `employee`, `subject`, `description` ) VALUES "+
				 							"(?, ?, ?, ?); ";

		 vo = new Object[4];
				vo[0] = adminId;
				vo[1] = idd;
				vo[2] = subject;
				vo[3] = description; 
		 
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						

						map_m.put("success", 1);
						 
						

					}
				 

					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}





public static Map<String, Object>addResume(String employee,String  hobbies,String  about,String  privacy,String  description, HttpServletRequest request) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false; 
		String idd = "0";
		HttpSession session = request.getSession();
		User user = (User)  session.getAttribute("user");
	  

		String query = " SELECT * FROM employee WHERE username = ?  ";
		
		Object[] vo = new Object[1];
		vo[0] = user.getUserName();
		
				

		try {
			ResultSet rs = (ResultSet) con.display(query , vo ); 
			while(rs.next()) {
				idd = rs.getString("id");
			} 
			rs.close();
			con.preparedStatement.close (); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			map_m.put("error", e.getMessage());
		} 


		String date = getDateTime();
		 
		 
		
		 con = new includes.Connection();
			 
		  String idf = "0";

			  query = " SELECT * FROM resume WHERE employee=? AND	hobbies=? AND	about=? AND	privacy=? AND description=? AND delete_status = 0  ";
			
				 vo = new Object[5];
					vo[0] = idd;
					vo[1] = hobbies;
					vo[2] = about;
					vo[3] = privacy; 
					vo[4] = description ;
			
					

			try {
				ResultSet rs = (ResultSet) con.display(query , vo ); 
				while(rs.next()) {
					idf = rs.getString("id");
					go =true;
				} 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				map_m.put("error", e.getMessage());
			} 

			
			
			
			if(go){
				map_m.put("success", 1); 
				map_m.put("message", "Academic  already exists");

				map_m.put("id",idf);
				return map_m;				
			}
		
		
		
		
		 
		con = new includes.Connection();
		 query = " INSERT INTO `resume` (employee,	hobbies,	about,	privacy, description , date) VALUES "+
				 							"(?, ?, ?, ?, ?, ?); ";

		 vo = new Object[6];
			vo[0] = idd;
			vo[1] = hobbies;
			vo[2] = about;
			vo[3] = privacy; 
			vo[4] = description; 
			vo[5] = date; 
		 
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						

						map_m.put("success", 1);
						
						
						con = new includes.Connection();
						 
						 query = " SELECT * FROM resume WHERE employee = ? AND date = ? ";
						
						vo = new Object[2];
						vo[0] = idd;
						vo[1] = date;
						
								

						try {
							ResultSet rs = (ResultSet) con.display(query , vo ); 
							while(rs.next()) {

								map_m.put("id", rs.getString("id"));
							} 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
							map_m.put("error", e.getMessage());
						} 

						

					}
				 

					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}




public static Map<String, Object>addAcademic(String resume, String institution,String  address,String  description,String  level,String  scale,String  grade,String  l_no, HttpServletRequest request) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false;  
	  

		String query = " SELECT * FROM academic WHERE resume =? AND	institution =? AND	address =? AND	l_no =? AND	level =? AND	scale =? AND	grade =? AND	description =? AND delete_status = 0  ";
		
		Object[] vo = new Object[8];
		vo[0] = resume;
		vo[1] = institution;
		vo[2] = address;
		vo[3] = l_no;
		vo[4] = level;
		vo[5] = scale;
		vo[6] = grade;
		vo[7] = description; 
		
				

		try {
			ResultSet rs = (ResultSet) con.display(query , vo ); 
			while(rs.next()) {
				go =true;
			} 
			rs.close();
			con.preparedStatement.close (); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			map_m.put("error", e.getMessage());
		} 

		
		
		
		if(go){
			map_m.put("success", 2); 
			map_m.put("message", "Academic  already exists");
			return map_m;				
		}
		
		
		 
	 
		 
		con = new includes.Connection();
		 query = " INSERT INTO `academic` (resume,	institution,	address,	l_no,	level,	scale,	grade,	description) VALUES "+
				 							"(?, ?, ?, ?, ?, ?, ?, ?); ";
 
		 
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){

						map_m.put("success", 1);


					}
				 

					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}



public static Map<String, Object>
addExperience(String resume,String  position,String  hr_contact,String   email,String  company, String  address,String  pin,String  l_no, 
		String years,String  url, String   description, HttpServletRequest request) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false;  
	  

		String query = " SELECT * FROM experience WHERE resume=? AND company=? AND 	address=? AND 	pin =? AND	l_no=? AND "+
		" position=? AND 	hr_contact=? AND 	email=? AND 	years=? AND 	url=? AND 	description	=? AND " + 
				"  delete_status = 0  ";
		
		Object[] vo = new Object[11];
		vo[0] = resume;
		vo[1] = company;
		vo[2] = address;
		vo[3] = pin;
		vo[4] = l_no;
		vo[5] = position;
		vo[6] = hr_contact;
		vo[7] = email; 
		vo[8] = years; 
		vo[9] = url; 
		vo[10] = description;  
		
				

		try {
			ResultSet rs = (ResultSet) con.display(query , vo ); 
			while(rs.next()) {
				go =true;
			} 
			rs.close();
			con.preparedStatement.close (); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			map_m.put("error", e.getMessage());
		} 

		
		
		
		if(go){
			map_m.put("success", 2); 
			map_m.put("message", "Academic  already exists");
			return map_m;				
		}
		
		
		  
		 
		con = new includes.Connection();
		 query = " INSERT INTO `experience` (resume,	company,	address,	pin,	l_no,	position,	hr_contact,	email,	years,	url,	description	) VALUES "+
				 							"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
 
		 
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){

						map_m.put("success", 1);


					}
				 

					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}

 

public static Map<String, Object>addAttachment(String resume,String  attachment,String  type,String  description, HttpServletRequest request) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false;  
	  

		String query = " SELECT * FROM attachment WHERE  resume =? AND	attachment =? AND	type =? AND	description =?  AND delete_status = 0  ";
		
		Object[] vo = new Object[4];
		vo[0] = resume;
		vo[1] = attachment;
		vo[2] = type;
		vo[3] = description; 
		
				

		try {
			ResultSet rs = (ResultSet) con.display(query , vo ); 
			while(rs.next()) {
				go =true;
			} 
			rs.close();
			con.preparedStatement.close (); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			map_m.put("error", e.getMessage());
		} 

		
		
		
		if(go){
			map_m.put("success", 2); 
			map_m.put("message", "Academic  already exists");
			return map_m;				
		}
		
		 
		 
		con = new includes.Connection();
		 query = " INSERT INTO `attachment` (resume,	attachment,	type,	description) VALUES "+
				 							"(?, ?, ?, ?); ";
 
		 
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){

						map_m.put("success", 1);


					}
				 

					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}






public static Map<String, Object> deleteResume( String id ) {

		includes.Connection con = new includes.Connection();
		
		Map <String, Object> map_m =  new HashMap<String, Object>();
		map_m.put("success", 0);

		boolean go =false; 

		String query = " SELECT * FROM resume WHERE id = ? AND delete_status = 0 ";
		
		Object[] vo = new Object[1];
				vo[0] = id;

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {
						go = true;
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		
		if(!go){
			map_m.put("success", 2);
			map_m.put("message", "no longer exist, reload the page! ");
			return map_m;				
		}

		con = new includes.Connection();

		 query = " UPDATE `resume` SET `delete_status` = ? WHERE `id`= ?  ";
		
		 vo = new Object[2];
				vo[1] = id;
				vo[0] = 1;
		
				
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						map_m.put("success", 1);
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}




public static Map<String, Object> setEmployee1( String id  , HttpServletRequest request) {

	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	String idd = "0";
	HttpSession session = request.getSession();
	User user = (User)  session.getAttribute("user");
  

	String query = " SELECT * FROM employee WHERE username = ?  ";
	
	Object[] vo = new Object[1];
	vo[0] = user.getUserName();
	
			

	try {
		ResultSet rs = (ResultSet) con.display(query , vo ); 
		while(rs.next()) {
			idd = rs.getString("id");
		} 
		rs.close();
		con.preparedStatement.close (); 
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
		map_m.put("error", e.getMessage());
	} 

	
	
	
		  con = new includes.Connection();
		 
		  go =false; 
		  String nlid = "";
		  query = " SELECT * FROM newsletter WHERE employee = ? AND delete_status = 0 ORDER BY date DESC LIMIT 1";
		
		  vo = new Object[1];
			vo[0] = idd; 

		
		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {
						nlid = rs.getString("id");
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		



		con = new includes.Connection();
		
		
		if( nlid.equals("")) {
			 query = " INSERT INTO `newsletter` (employee, company) VALUES (?, ?) ";
				
			 vo = new Object[2];
					vo[0] = idd;
					vo[1] = id;
			
		} else {

		 query = " UPDATE `newsletter` SET `company` = ? WHERE `employee`= ?  ";
		
		 vo = new Object[2];
				vo[0] = id;
				vo[1] = idd;
		
		}	
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						map_m.put("success", 1);
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}







public static Map<String, Object> setEmployee2( String id  , HttpServletRequest request) {

	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	String idd = "0";
	HttpSession session = request.getSession();
	User user = (User)  session.getAttribute("user");
  

	String query = " SELECT * FROM employee WHERE username = ?  ";
	
	Object[] vo = new Object[1];
	vo[0] = user.getUserName();
	
			

	try {
		ResultSet rs = (ResultSet) con.display(query , vo ); 
		while(rs.next()) {
			idd = rs.getString("id");
		} 
		rs.close();
		con.preparedStatement.close (); 
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
		map_m.put("error", e.getMessage());
	} 

	
	
	
		  con = new includes.Connection();
		 
		  go =false; 
		  String nlid = "";
		  query = " SELECT * FROM newsletter WHERE employee = ? AND delete_status = 0 ORDER BY date DESC LIMIT 1";
		
		  vo = new Object[1];
			vo[0] = idd; 

		
		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {
						nlid = rs.getString("id");
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		



		con = new includes.Connection();
		
		
		if( nlid.equals("")) {
			 query = " INSERT INTO `newsletter` (employee, category) VALUES (?, ?) ";
				
			 vo = new Object[2];
					vo[0] = idd;
					vo[1] = id;
			
		} else {

		 query = " UPDATE `newsletter` SET `category` = ? WHERE `employee`= ?  ";
		
		 vo = new Object[2];
				vo[0] = id;
				vo[1] = idd;
		
		}	
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						map_m.put("success", 1);
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}





public static Map<String, Object> setEmployee3( String id  , HttpServletRequest request) {

	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	String idd = "0";
	HttpSession session = request.getSession();
	User user = (User)  session.getAttribute("user");
  

	String query = " SELECT * FROM employee WHERE username = ?  ";
	
	Object[] vo = new Object[1];
	vo[0] = user.getUserName();
	
			

	try {
		ResultSet rs = (ResultSet) con.display(query , vo ); 
		while(rs.next()) {
			idd = rs.getString("id");
		} 
		rs.close();
		con.preparedStatement.close (); 
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
		map_m.put("error", e.getMessage());
	} 

	
	
	
		  con = new includes.Connection();
		 
		  go =false; 
		  String nlid = "";
		  query = " SELECT * FROM newsletter WHERE employee = ? AND delete_status = 0 ORDER BY date DESC LIMIT 1";
		
		  vo = new Object[1];
			vo[0] = idd; 

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {
						nlid = rs.getString("id");
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		



		con = new includes.Connection();
		
		
		if( nlid.equals("")) {
			 query = " INSERT INTO `newsletter` (employee, education) VALUES (?, ?) ";
				
			 vo = new Object[2];
					vo[0] = idd;
					vo[1] = id;
			
		} else {

		 query = " UPDATE `newsletter` SET `education` = ? WHERE `employee`= ?  ";
		
		 vo = new Object[2];
				vo[0] = id;
				vo[1] = idd;
		
		}	
				try {
					int result =   con.execute(query , vo );

					if(result != 0){
						map_m.put("success", 1);
					}



					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}

	return map_m;
}




public static Map<String, Object> getNewsLetters(  HttpServletRequest request) {

	includes.Connection con = new includes.Connection();
	
	Map <String, Object> map_m =  new HashMap<String, Object>();
	map_m.put("success", 0);

	boolean go =false; 
	String idd = "0";
	HttpSession session = request.getSession();
	User user = (User)  session.getAttribute("user");
  

	String query = " SELECT * FROM employee WHERE username = ?  ";
	
	Object[] vo = new Object[1];
	vo[0] = user.getUserName();
	
			

	try {
		ResultSet rs = (ResultSet) con.display(query , vo ); 
		while(rs.next()) {
			idd = rs.getString("id");
		} 
		rs.close();
		con.preparedStatement.close (); 
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
		map_m.put("error", e.getMessage());
	} 

	
	
	
		  con = new includes.Connection();
		 
		  go =false; 
		  String nlid = "";
		  query = "SELECT er.company, j.name AS category, ed.name AS education FROM `newsletter` n LEFT JOIN employer er ON er.id = n.company LEFT JOIN job_category j ON j.id = n.category LEFT JOIN education ed ON ed.id = n.education WHERE n.employee = ? ORDER BY n.date DESC LIMIT 1";
		
		  vo = new Object[1];
			vo[0] = idd; 

		
				
				try {
					ResultSet rs = (ResultSet) con.display(query , vo );
					
					
					while(rs.next()) {

						map_m.put("success", 1);
						map_m.put("company", rs.getString("company"));
						map_m.put("category", rs.getString("category"));
						map_m.put("education", rs.getString("education")); 
					}

					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					map_m.put("error", e.getMessage());
				}
		

 

	return map_m;
}

// 
















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static int toSomeOne( String to, String subject, String type,  String content) {
		int status = 0;
		String msg = "http://localhost:8080/ProjectX/employerConfirmpage?confirm="+ content;
		status = email.GetEmail.isMail( to, subject, msg);
		return status;
	}
	
	private static String getDateTime() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = 
			     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return  sdf.format(dt)+"";		
	}
}
