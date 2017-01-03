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
  boolean denied = false;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    HttpSession session = request.getSession();
    response.setContentType("text/html;charset=UTF-8");

    try (PrintWriter out = response.getWriter()) {
      user = request.getParameter("userName").toLowerCase();
      pass = request.getParameter("userPassword");
      String cpage = (String) session.getAttribute("cpage");
      if (cpage == null) {
        cpage = "OrderedList.jsp";
      }

      try {
        int count = 0;
        con = Database.getConnection();
        ps = (PreparedStatement) con.prepareStatement("Select * from accounts");
        rs = ps.executeQuery();
        while (rs.next()) {
          String u = rs.getString(2);
          String p = rs.getString(3);
          if (u.equals(user) && p.equals(pass)) {
            request.getSession().setAttribute("us", user);
            request.getSession().setAttribute("pa", pass);
            getServletContext().getRequestDispatcher("/" + cpage).forward(request, response);
            count = 1;
          }
        }
        if (count == 0) {

          denied = true;
          session.setAttribute("denied", denied);
          getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
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
// <editor-fold>

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
  } //</editor-fold>

}
