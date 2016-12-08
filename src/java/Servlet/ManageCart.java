package Servlet;

import JavaClass.Cart1;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ManageCart extends HttpServlet {

  String del, upd;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    ArrayList mycart = (ArrayList) session.getAttribute("listtt");
    if(mycart == null){
      mycart = new ArrayList();
    }
    upd = request.getParameter("upd");
    del = request.getParameter("del");

    if (upd != null) {

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
