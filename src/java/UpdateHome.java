
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

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List lst = new ArrayList();
    Blob image = null;
    byte[] img = null;
    HttpSession ss;
    OutputStream o;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ss = request.getSession();
        try {
            con = Database.getConnection();
            ps = (PreparedStatement) con.prepareStatement("Select picture from product");
            rs = ps.executeQuery();

            while (rs.next()) {
                image = rs.getBlob(3);
                img = image.getBytes(1, (int) image.length());
                response.setContentType("image/jpg");
                o = response.getOutputStream();
                o.write(img);
                o.flush();
                o.close();
            }

        } catch (SQLException e) {

        } finally {
            try {
                con.close();
                ps = null;
                rs = null;

            } catch (SQLException e) {
                //    RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
                //   rd.forward(request, response);
            }
           // ss.setAttribute("Aw", o);
          //  RequestDispatcher rd = request.getRequestDispatcher("/latestProduct.jsp");
          //  rd.forward(request, response);

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
