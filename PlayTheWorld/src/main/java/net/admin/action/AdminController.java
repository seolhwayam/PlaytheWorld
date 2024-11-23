package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class AdminController 
 	extends javax.servlet.http.HttpServlet 
 	implements javax.servlet.Servlet {
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 Action action=null;
			/*
			 * if(command.equals("/BoardWrite.bo")){ forward=new ActionForward();
			 * forward.setRedirect(false); forward.setPath("./board/qna_board_write.jsp");
			 * }else if(command.equals("/AdminList.ad")){ action = new AdminListAction();
			 * try{ forward=action.execute(request, response); }catch(Exception e){
			 * e.printStackTrace(); } } else if(command.equals("/AdminDetail.ad")){ action =
			 * new AdminDetailAction(); try{ forward=action.execute(request, response);
			 * }catch(Exception e){ e.printStackTrace(); } } else
			 * if(command.equals("/AdminDelete.ad")){ action = new AdminDeleteAction(); try{
			 * forward=action.execute(request, response); }catch(Exception e){
			 * e.printStackTrace(); } }
			 */
		   if(forward.isRedirect()){ //Redirect 방식
			   response.sendRedirect(forward.getPath());
		   }else{//forward방식
			   RequestDispatcher dispatcher=
				   request.getRequestDispatcher(forward.getPath());
			   dispatcher.forward(request, response);
		   }
	 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess(request,response);
	}  	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess(request,response);
	}   	  	    
}