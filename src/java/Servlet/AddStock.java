package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddStock extends HttpServlet {
  Connection con;
  PreparedStatement ps = null;
  ResultSet rs = null;
  List lst = new ArrayList();


  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try {
      con = Database.getConnection();
      ps = (PreparedStatement) con.prepareStatement("Select * from product");
      rs = ps.executeQuery();
      while (rs.next()) {
        lst.add(rs.getString("ID"));
        lst.add(rs.getString("productName"));
        lst.add(rs.getString("stack"));

      }
    } catch (SQLException e) {

    } finally {
      try {
        con.close();
        ps = null;
        rs = null;
        request.setAttribute("prod", lst);
        RequestDispatcher rd = request.getRequestDispatcher("/addStock.jsp");
        rd.forward(request, response);
        lst.clear();

      } catch (SQLException e) {

      }
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
  }// </editor-fold>

}
