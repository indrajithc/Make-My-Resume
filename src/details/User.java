package details;
 

public class User {
	
	private String userName = null;
	private String email = null; 
	private String type = null;
	private String image = null;
	private String mobile = null;
	private String name = null;
	



	public String message = "validate first";
	
	public User() {
		
	}
	
	public String getMessage() {
		return message;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}




	
	
	
	

	public boolean validate() {
		boolean status = false;

		if( email == null || email.trim().length() <1) {
			message = " null value , email ";
			return false;
			
		}
		

		if( userName == null || userName.trim().length() <1) {
			message = " null value , email ";
			return false;
			
		}
		
		
		
		
		
		try {
			String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	        java.util.regex.Matcher m = p.matcher(email);
	        status = m.matches();
	        if(!status)
	        	message = "invalid email address";
		} catch (Exception e) {
			 status = false;
			 message = e.getMessage();
		}
		
		
		
		
		if(status)
			message = "good to go";
		
		
		return status;
	}
 
	

}
