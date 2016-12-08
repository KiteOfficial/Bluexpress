package Servlet;

import JavaClass.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Cart extends HttpServlet {

  Double price, tprice;
  String prodname, type;
  int qty, ID;
  boolean aa,ab;

  ArrayList list = new ArrayList();

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    HttpSession session1 = request.getSession();
    list = (ArrayList) session1.getAttribute("listtt");
    if (list == null) {
      list = new ArrayList();

    }

    ID = Integer.parseInt(request.getParameter("ID"));
    price = Double.parseDouble(request.getParameter("price"));
    prodname = request.getParameter("prodname");
    qty = Integer.parseInt(request.getParameter("Qty"));
    tprice = price * qty;
    type = request.getParameter("type");
    aa = true;
    ab = false;

    if (session1.getAttribute("listtt") != null) {
      ArrayList mycart = (ArrayList) session1.getAttribute("listtt");
      for (int i = 0; i < mycart.size(); i++) {
        Cart1 it = (Cart1) mycart.get(i);
        if (ID == it.getID()) {
          aa = false;
          ab = true;
        }

      }
    }

    if (aa == true) {
      Cart1 s = new Cart1(ID, qty, prodname, price, tprice);

      list.add(s);
      session1.setAttribute("listtt", list);
      session1.setAttribute("aa", aa);
      session1.setAttribute("ab", ab);
      response.sendRedirect(type);
    }
    else if(ab == true){
      session1.setAttribute("aa", aa);
      session1.setAttribute("ab", ab);
      response.sendRedirect(type);
    } else{
      session1.setAttribute("aa", aa);
      session1.setAttribute("ab", ab);
      response.sendRedirect(type);
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
