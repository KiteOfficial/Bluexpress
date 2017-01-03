
package CallServlet;

import function.Database;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class GlassProduct extends HttpServlet {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List prod = new ArrayList();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            getServletContext().getRequestDispatcher("/Glass.jsp").forward(request, response);
            
        
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
