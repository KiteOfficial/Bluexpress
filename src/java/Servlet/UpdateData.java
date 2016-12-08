package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdateData extends HttpServlet {

  public static String pName, price, desc, id, type;
  
  Connection con = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try{
      id = request.getParameter("ID");
      pName = request.getParameter("productname");
      price = request.getParameter("price");
      desc = request.getParameter("description");
      type = request.getParameter("type");
      
      con = Database.getConnection();
      ps = con.prepareStatement("update product set productName = ?, price = ?, description = ?, type = ? where id = ?");
      ps.setString(1, pName);
      ps.setString(2, price);
      ps.setString(3, desc);
      ps.setString(5, id);
      ps.setString(4, type);
      ps.executeUpdate();
    }catch(SQLException e){
      
    }finally{
      try{
        con.close();
        ps=null;
        rs=null;
        getServletContext().getRequestDispatcher("/ViewAll").forward(request, response);
      }catch(SQLException e){
        
      }
    }
    
    
    out.close();
    
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }

}
