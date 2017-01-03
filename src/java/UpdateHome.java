
import function.Database;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/updateHome")
@MultipartConfig(maxFileSize = 16177215)
public class UpdateHome extends HttpServlet {

  public static String query, name1, img1, name2, img2, name3, img3, name4, img4, name5, img5, sub1, sub2, sub3, sub4, sub5, id;
  

  File img;

  FileInputStream photo1;
  Part part;
  String message, sas;

  Connection con = null;
  PreparedStatement ps = null;
  ResultSet rs = null;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String error = null;
    try {
      InputStream inputStream = null;

      sub1 = request.getParameter("im1");
      sub2 = request.getParameter("im2");
      sub3 = request.getParameter("im3");
      sub4 = request.getParameter("im4");
      sub5 = request.getParameter("im5");

      if (sub1 != null) {
        id = "1";
        part = request.getPart("file1");

        if (part != null) {
          sas = part.getContentType();
          if (sas.equals("image/jpeg")) {
            inputStream = part.getInputStream();
          }

        }
      }

      if (sub2 != null) {
        id = "2";
        part = request.getPart("file2");

        if (part != null) {
          sas = part.getContentType();
          if (sas.equals("image/jpeg")) {
            inputStream = part.getInputStream();
          }

        }
      }
      if (sub3 != null) {
        id = "3";
        part = request.getPart("file3");

        if (part != null) {
          sas = part.getContentType();
          if (sas.equals("image/jpeg")) {
            inputStream = part.getInputStream();
          }

        }
      }
      if (sub4 != null) {
        id = "4";
        part = request.getPart("file4");

        if (part != null) {
          sas = part.getContentType();
          if (sas.equals("image/jpeg")) {
            inputStream = part.getInputStream();
          }

        }
      }
      if (sub5 != null) {
        id = "5";
        part = request.getPart("file5");

        if (part != null) {
          sas = part.getContentType();
          if (sas.equals("image/jpeg")) {
            inputStream = part.getInputStream();
          }

        }
      }

      con = Database.getConnection();

      ps = (PreparedStatement) con.prepareStatement("update imageproperty set image = ? where image_id = ?");
      ps.setString(2, id);
      if (inputStream != null) {
        ps.setBlob(1, inputStream);
      }//sends the statement to the database server
      ps.executeUpdate();

      

    } catch (SQLException e) {

    } finally {
      if (con != null) {
        try {
          con.close();
          ps = null;
          rs = null;
          getServletContext().getRequestDispatcher("/DisplayImageManage").forward(request, response);

        } catch (SQLException e) {
          request.setAttribute("Error", error);
          getServletContext().getRequestDispatcher("/Error.jsp").forward(request, response);
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
