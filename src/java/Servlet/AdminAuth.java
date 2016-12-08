package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminAuth extends HttpServlet {

  Connection con = null;
  PreparedStatement ps;
  ResultSet rs;
  public static String pass, user;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      user = request.getParameter("userName");
      pass = request.getParameter("userPassword");

      try {

        con = Database.getConnection();
        ps = (PreparedStatement) con.prepareStatement("Select * from accounts");
        rs = ps.executeQuery();
        while (rs.next()) {
          String u = rs.getString(2);
          String p = rs.getString(3);
          if (u.equals(user) && p.equals(pass)) {
            request.getSession().setAttribute("us", user);
            request.getSession().setAttribute("pa", pass);
            getServletContext().getRequestDispatcher("/OrderedList.jsp").forward(request, response);
          }
        }

      } catch (SQLException e) {

      } finally {
        try {

          con.close();
          ps = null;
          rs = null;

        } catch (SQLException e) {

        }
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
