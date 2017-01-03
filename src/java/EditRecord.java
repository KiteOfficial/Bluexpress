
import function.Database;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class EditRecord extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String id,query;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            id = request.getParameter("id");
            
            con = Database.getConnection();
            
            ps = con.prepareStatement("Select * from product where id = ?");
            ps.setString(1, id);
            
            rs = ps.executeQuery();
            while(rs.next()){
              request.setAttribute("ID", rs.getString("ID"));
              request.setAttribute("name", rs.getString("productName"));
              request.setAttribute("price", rs.getString("price"));
              request.setAttribute("details", rs.getString("description"));
            }
            
        } catch (SQLException e) {

        } finally {
            try {
                
                
                
                RequestDispatcher rd = request.getRequestDispatcher("/editdata.jsp");
                rd.forward(request, response);
                con.close();
            } catch (SQLException e) {

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
