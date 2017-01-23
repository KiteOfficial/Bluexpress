package Servlet;

import JavaClass.Cart1;
import function.Database;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

public class ManageCart extends HttpServlet {

  String del, upd, cname, comname, cno, email, tprice, submit, clear1, comadd, update, quantity, IDID;
  Double totalprice,fortotal;
  Integer maxstack,count=0;

  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  boolean empty = false, clear = false, success = false, max;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    ArrayList mycart = (ArrayList) session.getAttribute("listtt");
    if (mycart == null) {
      mycart = new ArrayList();

    }
    clear1 = request.getParameter("clear");
    del = request.getParameter("del");
    submit = request.getParameter("submit");
    cname = request.getParameter("cname");
    comname = request.getParameter("comname");
    cno = request.getParameter("cno");
    email = request.getParameter("email");
    comadd = request.getParameter("comadd");
    tprice = request.getParameter("totalprice");
    update = request.getParameter("update");
    quantity = request.getParameter("quantity");
    IDID = request.getParameter("IDID");

    if (update != null) {
      int parseqty = Integer.parseInt(quantity);
      int parseupdate = Integer.parseInt(update);

      try {
        con = Database.getConnection();
        ps = con.prepareStatement("Select * from product where id = ?");
        ps.setString(1, IDID);
        rs = ps.executeQuery();
        while (rs.next()) {
          maxstack = rs.getInt("Stack");
        }

        if (parseqty > maxstack) {
          max = true;
          session.setAttribute("max", max);
          session.setAttribute("maximum", maxstack);
          response.sendRedirect("Cart.jsp");
        } else {
          Cart1 it = (Cart1) mycart.get(parseupdate);
          double totals = it.getPrice();
          double totalnew = parseqty * totals;
          it.setTprice(totalnew);
          it.setQty(parseqty);
          session.setAttribute("listtt", mycart);
          response.sendRedirect("Cart.jsp");
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

    if (clear1 != null) {
      session.removeAttribute("listtt");
      clear = true;
      session.setAttribute("clearr", clear);
      response.sendRedirect("Cart.jsp");
    }
    if (submit != null) {
      if (mycart.isEmpty()) {

        empty = true;
        session.setAttribute("empty", empty);
        response.sendRedirect("Cart.jsp");
      } else {
        try {
          con = Database.getConnection();
          ps = con.prepareStatement("Insert into customer (Name, Contact, Email, total_price, companyname, companyaddress, status) values (?, ?, ?, ?, ?, ?, ?)");
          ps.setString(1, cname);
          ps.setString(5, comname);
          ps.setString(2, cno);
          ps.setString(3, email);
          ps.setString(4, tprice);
          ps.setString(6, comadd);
          ps.setString(7, "Waiting");
          ps.executeUpdate();
          
          

        } catch (SQLException e) {
          JOptionPane.showMessageDialog(null, e);
        } finally {
          try {
            con.close();
            ps = null;
            rs = null;
            success = true;
            session.setAttribute("success", success);
            getServletContext().getRequestDispatcher("/Pass").forward(request, response);
          } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
          }
        }
      }
    }
    if (del != null) {
      Cart1 item_to_Delete = (Cart1) mycart.get(Integer.parseInt(del));
      mycart.remove(Integer.parseInt(del));

      session.setAttribute("listtt", mycart);

      response.sendRedirect("Cart.jsp");
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
