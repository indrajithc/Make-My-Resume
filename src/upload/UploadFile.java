package upload;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
 





import javax.servlet.http.HttpSession;

import java.util.List;

//import org.apache.catalina.servlet4preview.ServletContext;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;


@WebServlet("/fileupload")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

    public UploadFile() {
        super();

    }
 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //process only if its multipart content

		Map <String, Object> map_m =  new HashMap<String, Object>();
		HttpSession authentication = request.getSession();


		map_m.put("success", 0); 
		
		try {
			ServletContext context = (ServletContext) request.getServletContext();
			details.Server SERVER = (details.Server) context.getAttribute("server");
			String referrer = request.getHeader("referer");
			if (authentication.getAttribute("user") == null || authentication.getAttribute("user").equals("")) {
				String go_to_this = "" + SERVER.getServerProtocol() + "://"
						+ SERVER.getServerName() + ":"
						+ SERVER.getServerPort() + ""
						+ SERVER.getContextPath() + "/loginpage"; 
				map_m.put("success", -1);
				map_m.put("authentication", false);
				map_m.put("page", go_to_this);
				map_m.put("to", referrer);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(new Gson().toJson(map_m));

			} else {
				doIfSuccess (request, response, map_m);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}
	
	
	
	private void doIfSuccess (HttpServletRequest request, HttpServletResponse response, Map <String, Object> map_m ) throws ServletException, IOException {
		
        if(ServletFileUpload.isMultipartContent(request)){
            try {  
            	FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> multiparts = upload.parseRequest(request);

                String root_path = controller.Controller.returnPath (request) + "/upload";
        		
                
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
 
                    	String time = System.currentTimeMillis() + "";
                        String name = new File(item.getName()).getName();   
                        String name_new =  time + "_" + name;
                        String path_new = includes.Connection.UPLOAD_DIRECTORY + "" + File.separator + name_new;
                        File xo = new File(path_new);
                        item.write( xo);
                    	 

                		map_m.put("success", 1); 
                		map_m.put("name", name_new); 
                		map_m.put("path", root_path); 
                		map_m.put("directory", root_path+"/"+name_new); 
                    }
                }

               map_m.put("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               map_m.put("message",  "File Upload Failed due to " + ex.getMessage());
            }         
        }else{
        	 map_m.put("message",  "Sorry this Servlet only handles file upload request");
        }

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(map_m));


   	
	}

}
