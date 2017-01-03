package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

public class EditStock extends HttpServlet {

  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  String id, query, stack;
  int add;
  boolean empty,yeah;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    id = request.getParameter("id");
    
    stack = request.getParameter("stock");
    if (stack==null) {
      empty = true;
      session.setAttribute("emptysiya", empty);
      getServletContext().getRequestDispatcher("/addStock.jsp").forward(request, response);
    } else {
      try {
        int idid = Integer.parseInt(id);
        int parse = Integer.parseInt(stack);

        con = Database.getConnection();

        ps = con.prepareStatement("Select * from product where id = ?");
        ps.setInt(1, idid);

        rs = ps.executeQuery();
        while (rs.next()) {
          int stock = rs.getInt("Stack");
          
          add = parse + stock;

        }
        ps = con.prepareStatement("Update product set stack = ? where id = ?");
        ps.setInt(1, add);
        ps.setInt(2, idid);
        ps.executeUpdate();

      } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, e);
      } finally {
        try {
          yeah = true;
          session.setAttribute("yeah", yeah);

          RequestDispatcher rd = request.getRequestDispatcher("/addStock.jsp");
          rd.forward(request, response);
          con.close();
          
        } catch (SQLException e) {
          JOptionPane.showMessageDialog(null, e);
        }
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
