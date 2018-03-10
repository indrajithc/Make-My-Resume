package operations;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest; 


public class Index {

	private static final String ADMIN = "1";
	
	static Map <String, Object> map =  new HashMap<String, Object>();
	 
	
	public static Map <String, Object> Function_Index (HttpServletRequest request, details.Server SERVER) throws IOException {
		
		//response.getWriter().write(request.getParameter("action"));
		
		switch (""+request.getParameter("action")) {
		
		
		//test case
		case "login":
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			
			map = Functions.login(email, password, request, SERVER);
						
			break;
			
			

		case "add-category":
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			
			
			map = Functions.addCategory(name, description);
						
			break;
			


		case "edit-category":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editCategory(name, description);
						
			break;


		case "delete-category":
			 name = request.getParameter("name");
			 
			map = Functions.deleteCategory(name);
						
			break;
			
			
		/*==============================================================================================*/	
 

		case "update-admin":
			 name = request.getParameter("name");
			 email = request.getParameter("email");
			 String mobile = request.getParameter("mobile");
			 String landline = request.getParameter("landline");
			 String image = request.getParameter("image"); 
			 
			map = Functions.updateAdmin( name, email, mobile, landline,  image );
						
			break;

			

			/*==============================================================================================*/	
		case "add-department":
			  name = request.getParameter("name");
			  description = request.getParameter("description");
			
			
			map = Functions.addDepartment(name, description);
						
			break;
			


		case "edit-department":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editDepartment(name, description);
						
			break;


		case "delete-department":
			 name = request.getParameter("name");
			 
			map = Functions.deleteDepartment(name);
						
			break;

			/*==============================================================================================*/	
			

			/*==============================================================================================*/	
		case "add-job-category":
			  name = request.getParameter("name");
			  description = request.getParameter("description");
			
			
			map = Functions.addJobCategory(name, description);
						
			break;
			


		case "edit-job-category":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editJobCategory(name, description);
						
			break;


		case "delete-job-category":
			 name = request.getParameter("name");
			 
			map = Functions.deleteJobCategory(name);
						
			break;

			/*==============================================================================================*/	
 	

			/*==============================================================================================*/	
		case "add-job":
			String category = request.getParameter("category");
			String department = request.getParameter("department");
			description = request.getParameter("description");
			String purpose = request.getParameter("purpose");
			String title = request.getParameter("title"); 
			
			
			map = Functions.addJob(category, department, description, purpose, title);
						
			break;
			
//

		case "edit-job":
			 category = request.getParameter("category");
			 department = request.getParameter("department");
			description = request.getParameter("description");
			 purpose = request.getParameter("purpose");
			 title = request.getParameter("title"); 
			
			
			
			map = Functions.editJob(category, department, description, purpose, title);
						
			break;
 
		case "delete-job":
			 category = request.getParameter("category"); 
			 title = request.getParameter("title"); 
			 
			map = Functions.deleteJob(category, title);
						
			break;

			/*==============================================================================================*/	

			/*==============================================================================================*/	
		case "add-language-category":
			  name = request.getParameter("name");
			  description = request.getParameter("description");
			
			
			map = Functions.addLanguageCategory(name, description);
						
			break;
			


		case "edit-language-category":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editLanguageCategory(name, description);
						
			break;


		case "delete-language-category":
			 name = request.getParameter("name");
			 
			map = Functions.deleteLanguageCategory(name);
						
			break;

			/*==============================================================================================*/	
 	

			/*==============================================================================================*/	
		case "add-language":
			  name = request.getParameter("name");
			  category = request.getParameter("category");
			  description = request.getParameter("description");
			
			
			map = Functions.addLanguage(name, category, description);
						
			break;
			


		case "edit-language":
			 name = request.getParameter("name");
			 category = request.getParameter("category");
			 description = request.getParameter("description");
			
			
			map = Functions.editLanguage(name, category, description);
						
			break;


		case "delete-language":
			 category = request.getParameter("category");
			 name = request.getParameter("name");
			 
			map = Functions.deleteLanguage(name, category);
						
			break;

			/*==============================================================================================*/	
 	
			
					
			
		case "get-employer":
			 String id = request.getParameter("id"); 
			 
			map = Functions.getEmployer(id);
						
			break;				
		case "active-employer":
			 id = request.getParameter("id"); 
			 String data = request.getParameter("data"); 
			 
			map = Functions.activeEmployer(id, data);
						
			break;	
			
			


		case "edit-admin-skills":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editAdminSkills(name, description, request);
						
			break;


		case "delete-admin-skills":
			 name = request.getParameter("name");
			 
			map = Functions.deleteAdminSkills(name, request);
						
			break;		

			


		case "edit-admin-competencies":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editAdminCompetencies(name, description, request);
						
			break;


		case "delete-admin-competencies":
			 name = request.getParameter("name");
			 
			map = Functions.deleteAdminCompetencies(name, request);
						
			break;		

		case "edit-admin-education":
			 name = request.getParameter("name");
			 description = request.getParameter("description");
			
			
			map = Functions.editAdminEducation(name, description, request);
						
			break;


		case "delete-admin-education":
			 name = request.getParameter("name");
			 
			map = Functions.deleteAdminEducation(name, request);
						
			break;
			
			

			
			
			
			
			
			
			
			
			
	
			
			
			
			
			
			
			

			/*====================================================================================*/
			/*======================================employer=====================================*/
			/*====================================================================================*/



		case "employer-register":
			String company = request.getParameter("company");
			String pin = request.getParameter("pin");
			 String country = request.getParameter("country");
			 String state = request.getParameter("state");
			 String username = request.getParameter("username");
			 mobile = request.getParameter("mobile");
			 password = request.getParameter("password"); 
			 
			map = Functions.employerRegister(company, pin, country, state, username, mobile, password,  request, SERVER);
						
			break;
			
			
			//test case
			case "employer-login":
				email = request.getParameter("email");
				password = request.getParameter("password");
				
				
				map = Functions.employerLogin(email, password, request, SERVER);
							
				break;
				
 

			case "update-employer":
				  id = request.getParameter("id");
				  company = request.getParameter("company");
				  pin = request.getParameter("pin");
				   country = request.getParameter("country");
				   state = request.getParameter("state");
				   username = request.getParameter("username");
				 mobile = request.getParameter("mobile");
				 String contact = request.getParameter("contact");
				 String start_date = request.getParameter("start_date");
				 String vision = request.getParameter("vision");
				 String hr_contact = request.getParameter("hr_contact");
				 String url = request.getParameter("url");
				 String l_no = request.getParameter("l_no");
				 String about = request.getParameter("about"); 
				   image = request.getParameter("image"); 
				 
				map = Functions.employerUpdate(id, company, pin, country, state, username, mobile, contact,
						start_date, vision, hr_contact, url, l_no, about, image, request, SERVER);
							
				break;		
			
			

				/*==============================================================================================*/	
			case "add-skills":
				  name = request.getParameter("name");
				  description = request.getParameter("description");
				
				
				map = Functions.addSkills(name, description, request);
							
				break;
				


			case "edit-skills":
				 name = request.getParameter("name");
				 description = request.getParameter("description");
				
				
				map = Functions.editSkills(name, description, request);
							
				break;


			case "delete-skills":
				 name = request.getParameter("name");
				 
				map = Functions.deleteSkills(name, request);
							
				break;

				/*==============================================================================================*/	
	 	
	
				
				

				/*==============================================================================================*/	
			case "add-competencies":
				  name = request.getParameter("name");
				  description = request.getParameter("description");
				
				
				map = Functions.addCompetencies(name, description, request);
							
				break;
				


			case "edit-competencies":
				 name = request.getParameter("name");
				 description = request.getParameter("description");
				
				
				map = Functions.editCompetencies(name, description, request);
							
				break;


			case "delete-competencies":
				 name = request.getParameter("name");
				 
				map = Functions.deleteCompetencies(name, request);
							
				break;

				/*==============================================================================================*/	
	 	
				
				
	
				
				

				/*==============================================================================================*/	
			case "add-education":
				  name = request.getParameter("name");
				  description = request.getParameter("description");
				
				
				map = Functions.addEducation(name, description, request);
							
				break;
				


			case "edit-education":
				 name = request.getParameter("name");
				 description = request.getParameter("description");
				
				
				map = Functions.editEducation(name, description, request);
							
				break;


			case "delete-education":
				 name = request.getParameter("name");
				 
				map = Functions.deleteEducation(name, request);
							
				break;

				/*==============================================================================================*/	

				/*==============================================================================================*/	
	 	
			case "get-job":
				category = request.getParameter("category");
				 
				map = Functions.getJob(category);
							
				break;		

				
							
				

			case "add-vacancies":
				String job = request.getParameter("job");
				String place = request.getParameter("place");
				String salary = request.getParameter("salary");
				String hours = request.getParameter("hours");
				String education = request.getParameter("education");
				String skills = request.getParameter("skills");
				String competencies = request.getParameter("competencies");
				String experience = request.getParameter("experience");
				String qualifications = request.getParameter("qualifications");
				description = request.getParameter("description");
				String interview = request.getParameter("interview");
				 
				map = Functions.addVacancies(job, place, salary, hours, education, skills, competencies, experience,
						qualifications, description, interview, request);
							
				break;				
				
					
				
			case "get-vacancies":
				id = request.getParameter("id"); 
				 
				map = Functions.getVacancies(id);
							
				break;	
				
				

			case "edit-vacancies":
				  id = request.getParameter("id");
				  job = request.getParameter("job");
				  place = request.getParameter("place");
				  salary = request.getParameter("salary");
				  hours = request.getParameter("hours");
				  education = request.getParameter("education");
				  skills = request.getParameter("skills");
				  competencies = request.getParameter("competencies");
				  experience = request.getParameter("experience");
				  qualifications = request.getParameter("qualifications");
				description = request.getParameter("description");
				  interview = request.getParameter("interview");
				 
				map = Functions.editVacancies(id, job, place, salary, hours, education, skills, competencies, experience,
						qualifications, description, interview, request);
							
				break;				

			case "delete-vacancies":
				  id = request.getParameter("id"); 
				 
				map = Functions.deleteVacancies(id );
							
				break;				
				
					
				

				/*==============================================================================================*/	
	 	
						
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				

				/*====================================================================================*/
				/*======================================employer=====================================*/
				/*====================================================================================*/



			case "employee-register":
				 String fname = request.getParameter("fname");
				 String  lname = request.getParameter("lname"); 
				   username = request.getParameter("username"); 
				 password = request.getParameter("password"); 
				 
				map = Functions.employeeRegister(fname, lname,  username , password,  request, SERVER);
							
				break;
				
				
				//test case
				case "employee-login":
					email = request.getParameter("email");
					password = request.getParameter("password");
					
					
					map = Functions.employeeLogin(email, password, request, SERVER);
								
					break;
					
	 

				case "update-employee":
					  id = request.getParameter("id");
					  fname = request.getParameter("fname");
					  lname = request.getParameter("lname"); 
					   username = request.getParameter("username");
					 mobile = request.getParameter("mobile");
					   String address = request.getParameter("address"); 
					   l_no = request.getParameter("l_no");
					   String sex = request.getParameter("sex"); 
					   image = request.getParameter("image"); 
					 
					map = Functions.employeeUpdate(id, fname, lname, username, mobile, address, l_no, sex, image, request, SERVER);
								
					break;		
				
				
 
				 

					/*==============================================================================================*/	

				case "get-language":
					id = request.getParameter("id");
					 
					map = Functions.getLanguage(id);
								
					break;	
				case "set-language":
					id = request.getParameter("id");
					 String status = request.getParameter("status");
					 
					map = Functions.setLanguage(id, status, request);
								
					break;		
					 
					/*==============================================================================================*/	

					 

					/*==============================================================================================*/	

				case "say-to-admin":
					String adminId = ADMIN; 
					String subject = request.getParameter("subject"); 
					description = request.getParameter("description");
					 
					map = Functions.toAdmin(adminId, subject, description, request);
								
					break;	 	
					 
					/*==============================================================================================*/	


					/*==============================================================================================*/	

				case "add-resume": 
					String employee = request.getParameter("employee"); 
					String hobbies = request.getParameter("hobbies");
					String privacy = request.getParameter("privacy");
					about = request.getParameter("about");
					description = request.getParameter("description"); 
					 
					map = Functions.addResume(employee, hobbies, about, privacy, description, request);
								
					break;	
					
					
				case "add-academic": 
					String resume = request.getParameter("resume"); 
					String institution = request.getParameter("institution");
					address = request.getParameter("address");
					description = request.getParameter("description");
					String level = request.getParameter("level"); 
					String scale = request.getParameter("scale"); 
					String grade = request.getParameter("grade"); 
					l_no = request.getParameter("l_no"); 
					 
					map = Functions.addAcademic(resume, institution, address,  description, level, scale, grade, l_no, request);
								
					break;
					
					
				case "add-experience": 
					  resume = request.getParameter("resume"); 
					String position = request.getParameter("position");
					hr_contact = request.getParameter("hr_contact");
					email = request.getParameter("email");
					  company = request.getParameter("company"); 
					  address = request.getParameter("address"); 
					 pin = request.getParameter("pin"); 
					l_no = request.getParameter("l_no"); 
					String years = request.getParameter("years"); 
					url = request.getParameter("url"); 
					description = request.getParameter("description");  
					 
					map = Functions.addExperience(resume, position, hr_contact,  email, company,address, pin, l_no, years,url,  description, request);
								
					break;	 
					

					
				case "add-attachment": 
					  resume = request.getParameter("resume"); 
					String attachment = request.getParameter("attachment");
					String type = request.getParameter("type"); 
					description = request.getParameter("description"); 
					 
					map = Functions.addAttachment(resume, attachment, type, description, request);
								
					break;	

				case "delete-resume": 
					  id = request.getParameter("id");  
					  
					map = Functions.deleteResume(id);
								
					break;	
					/*==============================================================================================*/	
					 
					/*==============================================================================================*/	
					 
					 				
				case "set-employee-1": 
					  id = request.getParameter("id");  
					  
					map = Functions.setEmployee1(id, request);
								
					break;	
					
				case "set-employee-2": 
					  id = request.getParameter("id");  
					  
					map = Functions.setEmployee2(id, request);
								
					break;	

				case "set-employee-3": 
					  id = request.getParameter("id");  
					  
					map = Functions.setEmployee3(id, request);
								
					break;
					
				case "get-newsletter":  
					map = Functions.getNewsLetters( request);
								
					break;	
					
							
					 
					/*==============================================================================================*/	
 
				 
					 
				
				
				
				
			
			
			

		default:
			break;
		}
		
		
		
		
		return map;
	}
}
