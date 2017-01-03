package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

public class ManageAbout extends HttpServlet {
  String update, email, fb, sn, gn, tn, add, comname, fname, lname,map,insta;
  boolean success = false;
  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    HttpSession session = request.getSession();
    update = request.getParameter("update");
    
    email = request.getParameter("email");
    fb = request.getParameter("fb");
    sn = request.getParameter("sn");
    gn = request.getParameter("gn");
    tn = request.getParameter("tn");
    add = request.getParameter("add");
    comname = request.getParameter("comname");
    fname = request.getParameter("fname");
    lname = request.getParameter("lname");
    map = request.getParameter("map");
    insta = request.getParameter("insta");
    
    
    
    
    if(update!=null){
      try{
        con = Database.getConnection();
        ps = con.prepareStatement("Select * from about where id = 1");
        rs = ps.executeQuery();
        while(rs.next()){
          if(email.isEmpty()){
            email = rs.getString("emailadd");
          }
          if(fb.isEmpty()){
            fb = rs.getString("facebook");
          }
          if(sn.isEmpty()){
            sn = rs.getString("contact_smart");
          }
          if(gn.isEmpty()){
            gn = rs.getString("contact_globe");
          }
          if(tn.isEmpty()){
            tn = rs.getString("contact_tel");
          }
          if(add.isEmpty()){
            add = rs.getString("address");
          }
          if(comname.isEmpty()){
            comname = rs.getString("cname");
          }
          if(fname.isEmpty()){
            fname = rs.getString("fname");
          }
          if(lname.isEmpty()){
            lname = rs.getString("lname");
          }
          if(map.isEmpty()){
            map = rs.getString("map");
          }
          if(insta.isEmpty()){
            insta = rs.getString("instagram");
          }
        }
      
        ps = con.prepareStatement("update about set emailadd = ?, facebook = ?, instagram = ?, contact_smart = ?, contact_globe = ?, contact_tel = ?, address = ?, cname = ?, fname = ?, lname = ?, map = ?  where id = 1");
        ps.setString(1, email);
        ps.setString(2, fb);
        ps.setString(3, insta);
        ps.setString(4, sn);
        ps.setString(5, gn);
        ps.setString(6, tn);
        ps.setString(7, add);
        ps.setString(8, comname);
        ps.setString(9, fname);
        ps.setString(10, lname);
        ps.setString(11, map);
        ps.executeUpdate();
      }catch(SQLException e){
        JOptionPane.showMessageDialog(null, e);
      }finally{
        try{
          con.close();
          ps = null;
          rs = null; 
          success = true;
          session.setAttribute("tanggap", success);
          getServletContext().getRequestDispatcher("/ManageAbout.jsp").forward(request, response);
        }catch(SQLException e){
          
        }
      }
      
      
    }else{
      getServletContext().getRequestDispatcher("/ManageAbout.jsp").forward(request, response);
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
