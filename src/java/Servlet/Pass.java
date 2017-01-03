package Servlet;

import JavaClass.Cart1;
import function.Database;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;

public class Pass extends HttpServlet {
  
  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  ArrayList list = new ArrayList();
  ArrayList list1 = new ArrayList();
  
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    ArrayList mycart = (ArrayList) session.getAttribute("listtt");
    if (mycart == null) {
      mycart = new ArrayList();
    }
    try {
      int max = 0, maxid = 0;
      con = Database.getConnection();
      ps = con.prepareStatement("SELECT MAX(order_id) as maxid FROM customerorder");
      rs = ps.executeQuery();
      while (rs.next()) {
        max = rs.getInt("maxid");
      }
      
      ps = con.prepareStatement("SELECT MAX(id) as maxid FROM customer");
      rs = ps.executeQuery();
      while (rs.next()) {
        maxid = rs.getInt("maxid");
      }
      
      ps = con.prepareStatement("Select numberofsale, stack FROM product where productName = ?");
      for (int i = 0; i < mycart.size(); i++) {
        Cart1 it = (Cart1) mycart.get(i);
        ps.setString(1, it.getProdname());
        rs = ps.executeQuery();
        while (rs.next()) {
          list.add(rs.getString(1));
          list1.add(rs.getString(2));
        }
      }
      
      if (session.getAttribute("listtt") != null) {
        ps = con.prepareStatement("Insert into customerorder (ID, Order_ID, Product, Quantity, Price) values (?, ?, ?, ?, ?)");
        for (int i = 0; i < mycart.size(); i++) {
          Cart1 it = (Cart1) mycart.get(i);
          ps.setString(3, it.getProdname());
          ps.setInt(2, max + 1);
          ps.setInt(1, maxid);
          ps.setInt(4, it.getQty());
          ps.setDouble(5, it.getPrice());
          ps.addBatch();
        }
        ps.executeBatch();
        
        ps = con.prepareStatement("UPDATE product set numberofsale = ?, stack = ? where productName = ?");
        for (int i = 0; i < mycart.size(); i++) {
          Cart1 it = (Cart1) mycart.get(i);
          String a = String.valueOf(list.get(i));
          String z = String.valueOf(list1.get(i));
          
          int b = Integer.parseInt(a);
          int x = Integer.parseInt(z);
          int c = b+it.getQty();
          int y = x-it.getQty();
          ps.setInt(1, c);
          ps.setInt(2, y);
          ps.setString(3, it.getProdname());
          ps.addBatch();
        }
        ps.executeBatch();
        
      }
      
    } catch (SQLException e) {
      JOptionPane.showMessageDialog(null, e);
    } finally {
      try {
        con.close();
        ps = null;
        rs = null;
        session.removeAttribute("listtt");
        getServletContext().getRequestDispatcher("/ShopCart1").forward(request, response);
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
