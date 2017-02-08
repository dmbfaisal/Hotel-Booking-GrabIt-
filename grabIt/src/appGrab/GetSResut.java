package appGrab;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetSResut extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetSResut() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
			{
				HttpSession current = request.getSession(false);
				if(current!=null)
				{
					try 
					{
						current.removeAttribute("RAvail");
						String s="";
						Class.forName("com.mysql.jdbc.Driver");
						Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/stay","root","12345");
						System.out.println("Connected");
						PreparedStatement ps= c.prepareStatement("select Fname from franinfo");
						ResultSet rs= ps.executeQuery();
						while(rs.next())
						{
							s=s+ rs.getString(1)+" ";
							
						}
						
						PreparedStatement ps1 = c.prepareStatement("select * from "+s+" where city=? and ac=?");
						ps1.setString(1,request.getParameter("city"));
						ps1.setString(2,request.getParameter("ac"));
						ResultSet rs1= ps1.executeQuery();
						current.setAttribute("sResult", rs1);
						RequestDispatcher rd= request.getRequestDispatcher("/searchPage.jsp");
						rd.forward(request,response);
					}
					catch(ClassNotFoundException ex)
					{}
					catch(SQLException ex)
					{}
				}

		
			}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
