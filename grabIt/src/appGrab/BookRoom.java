package appGrab;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import temp.MyDate;

public class BookRoom extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookRoom() {
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
			System.out.println("booking procedure started");
			HttpSession current =request.getSession(false);
			if(current!=null)
			{
				System.out.println("session found");
				String user=(String)current.getAttribute("info");
				LocalDate bdate=LocalDate.parse(request.getParameter("bdate"));
				LocalDate cdate=LocalDate.parse(request.getParameter("chdate")) ;
				
				try 
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/stay","root","12345");
					System.out.println("Connected");
					String temp=request.getParameter("val");
					String comp=temp.substring(0,temp.indexOf("#"));
					String id= temp.substring(temp.indexOf("#")+1 ,temp.length());
					System.out.println(comp+" /"+id);
					
					PreparedStatement ps;
					ps=c.prepareStatement("select * from "+comp+" where id=? ");
					ps.setString(1,id);
					ResultSet rs= ps.executeQuery();
					System.out.println("getting hotel Information");
					rs.next();
					int r=rs.getInt("rooms");
					int counter=0;
					int aroom=-1;
					ResultSet rs1;
					LocalDate btemp,ctemp;
					boolean avail=false;
					
					for( counter=1;counter<=r && !(avail);counter++)
					{
						System.out.println("checking room no"+counter);
						avail=true;
						ps= c.prepareStatement("select * from bookings where room=? and fran=? and hotelid=?");
						ps.setInt(1,counter);
						ps.setString(2,comp);
						ps.setInt(3,Integer.parseInt(id));
						rs1=ps.executeQuery();
						
						if(rs1.next())
						{
							System.out.println("found bookings for room "+counter);
							rs1.previous();
							while(rs1.next())
							{
								btemp=LocalDate.parse(rs1.getString("bdate"));
								ctemp=LocalDate.parse(rs1.getString("cdate"));
								if(!((cdate.compareTo(btemp)<0)||(bdate.compareTo(ctemp)>0)))
								{
									System.out.println("not available room no "+counter);
									avail=false;
									break;
									
								}
								else
								{
									if(aroom<0)
									{
										System.out.println("assigned room to aroom "+counter);
										aroom=counter;
									}
								}
							}
								if(avail)
								{
									System.out.println("available room "+counter);
									RequestDispatcher rd= request.getRequestDispatcher("/CndPay.jsp");
									long stay= MyDate.daysbetween(bdate, cdate);
									current.setAttribute("bdate", request.getParameter("bdate"));
									current.setAttribute("chdate", request.getParameter("chdate"));
									current.setAttribute("days",new Long(stay));
									current.setAttribute("hotel", rs);
									current.setAttribute("room",new Integer(aroom));
									current.setAttribute("bcomp", comp);
									rd.forward(request, response);
								}
								
						}
						else
						{
							System.out.println("assigning room as no booking found for room "+counter);
							RequestDispatcher rd= request.getRequestDispatcher("/CndPay.jsp");
							current.setAttribute("hotel", rs);
							current.setAttribute("room",new Integer(counter));
							rd.forward(request, response);
						}
					}
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
