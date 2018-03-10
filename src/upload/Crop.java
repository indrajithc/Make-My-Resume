package upload;

import java.awt.AlphaComposite;
import java.awt.Graphics2D; 
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap; 
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.servlet4preview.ServletContext; 

import com.google.gson.Gson; 
 

 
@WebServlet("/crop")
public class Crop extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //process only if its multipart content

				Map <String, Object> map_m =  new HashMap<String, Object>();
				HttpSession authentication = request.getSession();


				map_m.put("success", 0); 
				
				try {
					ServletContext context = (ServletContext) request.getServletContext();
					details.Server SERVER = (details.Server) context.getAttribute("server");
					String referrer = request.getHeader("referer");
					if (authentication.getAttribute("user") == null
							|| authentication.getAttribute("user").equals("")) {
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
				try {
 
					String photo_url = request.getParameter("photo_url");
					String sest_utl_p_ = request.getParameter("sest_utl_p_");
					int x = (int)Float.parseFloat(request.getParameter("x"));
					int y = (int)Float.parseFloat(request.getParameter("y"));
					int w = (int)Float.parseFloat(request.getParameter("w"));
					int h = (int)Float.parseFloat(request.getParameter("h"));
					int targ_w = (int)Float.parseFloat(request.getParameter("targ_w"));
					int targ_h = (int)Float.parseFloat(request.getParameter("targ_h"));
					

					int r = (int)Float.parseFloat(request.getParameter("r"));
					int sx = (int)Float.parseFloat(request.getParameter("sx"));
					int sy = (int)Float.parseFloat(request.getParameter("sy"));
					
					
					
					

					String path_original = includes.Connection.IN_DIRECTORY + "/upload" + File.separator + photo_url;
					String path_new = includes.Connection.IN_DIRECTORY + sest_utl_p_ + File.separator + photo_url;

	                String root_path = controller.Controller.returnPath (request) + sest_utl_p_ ;
	        		

					map_m.put("path_original", path_original); 
					map_m.put("path_new", path_new); 

 
					try {
						BufferedImage originalImgage = ImageIO.read(new File(path_original));
						 
						try {
							 if(sx == -1 && sy != 1) {
								 AffineTransform at = new AffineTransform();
						        at.concatenate(AffineTransform.getScaleInstance(sx, sy));
						        at.concatenate(AffineTransform.getTranslateInstance(-originalImgage.getWidth(), 0));
						        originalImgage = createTransformed(originalImgage, at);
							 }
							 if(sx == 1 && sy == -1) {
								 AffineTransform at = new AffineTransform();
						        at.concatenate(AffineTransform.getScaleInstance(sx, sy));
						        at.concatenate(AffineTransform.getTranslateInstance(0, -originalImgage.getHeight()));
						        originalImgage = createTransformed(originalImgage, at);
							 }

							 if(sx == -1 && sy == -1) {
								 AffineTransform at = new AffineTransform();
						        at.concatenate(AffineTransform.getScaleInstance(sx, sy));
						        at.concatenate(AffineTransform.getTranslateInstance(-originalImgage.getWidth(null), -originalImgage.getHeight(null)));
						        originalImgage = createTransformed(originalImgage, at);
							 }
						        
						} catch (Exception e) {
							// TODO: handle exception
						}
						
						try {
							if(r!=0){ 
								AffineTransform tx = new AffineTransform();
							    tx.rotate(Math.toRadians(r), originalImgage.getWidth() / 2, originalImgage.getHeight() / 2);
							    AffineTransformOp op = new AffineTransformOp(tx,  AffineTransformOp.TYPE_BILINEAR);
							    originalImgage = op.filter(originalImgage, null); 						
							}
						} catch (Exception e) {

				               map_m.put("message-rotate",  "Failed due to " + e.getMessage());
						}
						
						

						BufferedImage SubImgage = originalImgage.getSubimage(x, y, w, h);

						  BufferedImage scaledBI = SubImgage;
						  	try {

						  		scaledBI = new BufferedImage(targ_w, targ_h, BufferedImage.TYPE_INT_RGB);
						        Graphics2D g = scaledBI.createGraphics();
						        g.setComposite(AlphaComposite.Src);
						        g.drawImage(SubImgage, 0, 0, targ_w, targ_h, null);
						        g.dispose();
							} catch (Exception e) {
								 map_m.put("message-in",  "Failed due to " + e.getMessage());
							}
						File outputfile = new File(path_new);
						ImageIO.write(scaledBI, "jpg", outputfile);
						
	            		map_m.put("success", 1); 
	            		map_m.put("name", photo_url); 
	            		map_m.put("source", path_original); 
	            		map_m.put("directory", root_path+"/"+photo_url); 

					} catch (IOException e) {

			               map_m.put("message",  " Failed due to " + e.getMessage());
					}

					
					
					
					
			        File file = new File(path_original);
			        boolean fileDelete = file.delete();
			        
            		map_m.put("source-delete", 0); 
            		
			            if (fileDelete) { 
		            		map_m.put("source-delete", 1); 
		            		map_m.put("source-message", "successfully deleted"); 
			            } else {
		            		map_m.put("source-delete", 0); 
		            		map_m.put("source-message", "cant delete a file"); 
			            } 
					
					
					
					
					
				} catch (Exception e) {
					// TODO: handle exception
				}


				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(new Gson().toJson(map_m));


		   	
			}
			
			
			private static BufferedImage createTransformed(BufferedImage image, AffineTransform at) {
			        BufferedImage newImage = new BufferedImage(
			            image.getWidth(), image.getHeight(),
			            BufferedImage.TYPE_INT_ARGB);
			        Graphics2D g = newImage.createGraphics();
			        g.transform(at);
			        g.drawImage(image, 0, 0, null);
			        g.dispose();
			        return newImage;
			    }
			
			
			
			
			

}
