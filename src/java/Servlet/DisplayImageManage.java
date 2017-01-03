package Servlet;

import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DisplayImageManage extends HttpServlet {

  Connection con = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  private static final int BUFFER_SIZE = 4096;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try {

      String filepath = "C:\\Users\\Atik\\BEII1\\web\\Images\\slider\\";
      con = Database.getConnection();
      ps = (PreparedStatement) con.prepareStatement("Select * From imageproperty");
      rs = ps.executeQuery();
      while (rs.next()) {
        Blob blob = rs.getBlob("image");
        InputStream inputStream1 = blob.getBinaryStream();
        OutputStream outputStream = new FileOutputStream(filepath + rs.getString("image_name") + ".jpg");
        int bytesRead = -1;
        byte[] buffer = new byte[BUFFER_SIZE];
        while ((bytesRead = inputStream1.read(buffer)) != -1) {
          outputStream.write(buffer, 0, bytesRead);
        }
        inputStream1.close();
        outputStream.close();
        System.out.println("File saved");
      }

    } catch (SQLException e) {
      System.out.println("Exception in InsertImage servlet" + e.getMessage());
      e.printStackTrace();
    } finally {
      if (con != null) {
        try {
          con.close();
          ps = null;
          rs = null;
          getServletContext().getRequestDispatcher("/ManagePage.jsp").forward(request, response);
        } catch (SQLException e) {

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
