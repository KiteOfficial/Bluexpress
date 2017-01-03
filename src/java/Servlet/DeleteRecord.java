package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DeleteRecord extends HttpServlet {

  Connection con = null;
  PreparedStatement ps = null;
  ResultSet rs = null;

  String id;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    try {
      con = Database.getConnection();
      

      id = request.getParameter("id");

      ps = con.prepareStatement("delete from product where id = ?");
      ps.setString(1, id);
      ps.executeUpdate();
    } catch (SQLException e) {

    } finally {
      try {
        con.close();
        ps = null;
        rs = null;
        getServletContext().getRequestDispatcher("/ViewAll").forward(request, response);
      } catch (SQLException e) {

      }
    }

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
