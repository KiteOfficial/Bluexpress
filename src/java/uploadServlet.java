
import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class uploadServlet extends HttpServlet {

    public static String query, pName, price, desc, type;

    File img;

    FileInputStream photo1;
    Part part;
    String message, sas;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String error = null;
        try {
          boolean accept = false;
            pName = request.getParameter("productname");
            price = request.getParameter("price");
            desc = request.getParameter("description");
            type = request.getParameter("type");
            InputStream inputStream = null; 
            Part filePart = request.getPart("photo");

            if (filePart != null) {
                sas = filePart.getContentType();
                if (sas.equals("image/jpeg")) {
                    inputStream = filePart.getInputStream();
                }

            }

            con = Database.getConnection();
            
            ps = con.prepareStatement("Select productName from product");
            rs = ps.executeQuery();
            while(rs.next()){
              if(pName.equals(rs.getString(1))){
                accept = true;
              }
              
            }
            if(accept != true){
            ps = (PreparedStatement) con.prepareStatement("Insert into product (productname, price, description, type, image, Numberofsale, Stack) values (?,?,?,?,?,?,?)");
            ps.setString(1, pName);
            ps.setString(2, price);
            ps.setString(3, desc);
            ps.setString(4, type);
            if (inputStream != null) {
              ps.setBlob(5, inputStream);
            }
            ps.setString(6, "0");
            ps.setString(7, "0");

            //sends the statement to the database server
            ps.executeUpdate();
            }
            session.setAttribute("accept",accept);
        } catch (SQLException e) {
            
            
            out.print("<br/>Error: " + e.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                    ps = null;
                    rs = null;
                    getServletContext().getRequestDispatcher("/DisplayImage").forward(request, response);
                    
                } catch (SQLException e) {
                    request.setAttribute("Error", error);
                    getServletContext().getRequestDispatcher("/Error.jsp").forward(request, response);
                }

            }
            
        }
        out.close();
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
