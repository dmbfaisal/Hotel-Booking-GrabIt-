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

public class CreateFAccount extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CreateFAccount() {
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
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/stay","root","12345");
			System.out.println("Connected");
			PreparedStatement ps= c.prepareStatement("select * from franinfo where Fname=? ");
			ps.setString(1,request.getParameter("username"));
			
			ResultSet rs= ps.executeQuery();
			if(rs.next())
			{
				System.out.println("taken");
				 request.setAttribute("uvalid","invalid");
				 RequestDispatcher rd= request.getRequestDispatcher("/Registeration.jsp?user=customer");
				 rd.forward(request, response);
			}
			else
			{
				PreparedStatement ps1=c.prepareStatement("insert into franinfo (Fname,password,email,mobile) values(?,?,?,?)");
				ps1.setString(1,request.getParameter("username"));
				ps1.setString(2,request.getParameter("pass"));
				ps1.setString(3,request.getParameter("email"));
				ps1.setString(4,request.getParameter("mob"));
				
				ps1.executeUpdate();
				PreparedStatement ps2 =c.prepareStatement("create table "+request.getParameter("username")+" ( id integer not null, addr varchar(45) not null , state varchar(15) not null , city varchar(15) not null , zip integer not null , rooms integer not null , ac integer not null , fare integer not null ,fname varchar(45) not null , primary key(id))");
				ps2.executeUpdate();
				RequestDispatcher rd= request.getRequestDispatcher("/login.jsp?user=hotelmanager");
				 rd.forward(request, response);
				
			}
		}
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
