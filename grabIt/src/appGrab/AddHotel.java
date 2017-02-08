package appGrab;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddHotel extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddHotel() {
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

		HttpSession current= request.getSession(false);
		String fran= (String)current.getAttribute("info");
		if(current!=null)
		{
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/stay","root","12345");
				System.out.println("Connected");
				PreparedStatement ps= c.prepareStatement("select max(id) from "+ fran);
				System.out.println(fran);
				
				ResultSet rs= ps.executeQuery();
				if(rs.next())
				{
					int i=rs.getInt(1)+1;
					PreparedStatement ps1=c.prepareStatement("insert into "+fran+" (id,addr,state,city,zip,rooms,ac,fare,fname) values(?,?,?,?,?,?,?,?,?)");
					ps1.setInt(1,i);
					ps1.setString(2,request.getParameter("add"));
					ps1.setString(3,request.getParameter("state"));
					ps1.setString(4,request.getParameter("city"));
					ps1.setInt(5,Integer.parseInt(request.getParameter("zip")));
					ps1.setInt(6,Integer.parseInt(request.getParameter("rooms")));
					ps1.setInt(7,Integer.parseInt(request.getParameter("ac")));
					ps1.setInt(8,Integer.parseInt(request.getParameter("rent")));
					ps1.setString(9,fran);
					ps1.executeUpdate();
					
					
					 RequestDispatcher rd= request.getRequestDispatcher("/FranchiseHomepage.jsp");
					 rd.forward(request, response);
				}
				else
				{
					int i=rs.getInt("id")+1;
					PreparedStatement ps1=c.prepareStatement("insert into "+fran+" (id,addr,state,city,zip,rooms,ac,fare) values(?,?,?,?,?,?,?,?)");
					ps1.setInt(1,i);
					ps1.setString(1,request.getParameter("add"));
					ps1.setString(1,request.getParameter("state"));
					ps1.setString(1,request.getParameter("city"));
					ps1.setInt(1,Integer.parseInt(request.getParameter("zip")));
					ps1.setInt(1,Integer.parseInt(request.getParameter("rooms")));
					ps1.setInt(1,Integer.parseInt(request.getParameter("ac")));
					ps1.setInt(1,Integer.parseInt(request.getParameter("fare")));
					ps1.executeUpdate();
					
					
					 RequestDispatcher rd= request.getRequestDispatcher("/FranchiseHomepage.jsp");
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
