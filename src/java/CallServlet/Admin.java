/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CallServlet;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Admin extends HttpServlet {

  Connection con = null;
  PreparedStatement ps;
  ResultSet rs;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    
      HttpSession session = request.getSession();
      if (request.getSession().getAttribute("us") != null) {
        getServletContext().getRequestDispatcher("/OrderedList.jsp").forward(request, response);
      } else {

        getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
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
