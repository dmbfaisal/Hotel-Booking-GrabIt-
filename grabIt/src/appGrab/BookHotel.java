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

public class BookHotel extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookHotel() {
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
			throws ServletException, IOException 
			{
			HttpSession current = request.getSession(false);
			if(current!=null)
			{
				try
				{
					ResultSet hotel=(ResultSet)current.getAttribute("hotel");
					Class.forName("com.mysql.jdbc.Driver");
					Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/stay","root","12345");
					System.out.println("Connected");
					System.out.println("servlet book hotel running");
					PreparedStatement ps1= c.prepareStatement("select max(bookingid) from bookings");
					System.out.println("generated booking id");
					ResultSet rs= ps1.executeQuery();
					int bid= rs.getInt(1)+1;
					System.out.println("starting booking "+bid);
					PreparedStatement ps=c.prepareStatement("insert into bookings (bookingid,fran, user,hotelid,room,transaction,add,state,city,zip,fare,bdate,cdate) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
					ps.setInt(1,bid);
					ps.setString(2,current.getAttribute("bcomp").toString());
					ps.setString(3,current.getAttribute("info").toString());
					ps.setInt(4,hotel.getInt("id"));
					ps.setInt(5,Integer.parseInt(current.getAttribute("room").toString()));
					ps.setString(6,request.getParameter("card"));
					ps.setString(7,rs.getString("addr"));
					ps.setString(8,rs.getString("state"));
					ps.setString(9,rs.getString("city"));
					ps.setString(10,rs.getString("zip"));
					ps.setInt(11,rs.getInt("fare")*Integer.parseInt(current.getAttribute("days").toString()));
					ps.setString(12,current.getAttribute("bdate").toString());
					ps.setString(13,current.getAttribute("chdate").toString());
					ps.executeUpdate();
					System.out.println("booked");
					current.removeAttribute("bdate");
					current.removeAttribute("chdate");
					current.removeAttribute("days");
					current.removeAttribute("hotel");
					current.removeAttribute("room");
					current.removeAttribute("bcomp");
					System.out.println("booking complete");
					
					RequestDispatcher rd = request.getRequestDispatcher("servlet/BookingHistory");
					current.setAttribute("pay","successfull");
					rd.forward(request, response);
				
				}
				catch(ClassNotFoundException e)
				{
					
				}
				catch(SQLException e)
				{
					
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
