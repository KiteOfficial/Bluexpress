package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class OrderedList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        ");


          String user = (String) session.getAttribute("us");
          if (user == null) {
            String cpage = "OrderedList";
            session.setAttribute("cpage", cpage);
            response.sendRedirect("Admin");

          }
        
      out.write("\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/Admin/main.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/Admin/Manage.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/Admin/ViewOrder.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/bootstrap.min.css\">\n");
      out.write("        <script src=\"JS/jquery.min.js\"></script>\n");
      out.write("        <script src=\"JS/bootstrap.min.js\"></script>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div id=\"Container\">\n");
      out.write("            <div id=\"navigator\">\n");
      out.write("                <ul>\n");
      out.write("                    <li class=\"active\"><a>Ordered List</a></li>\n");
      out.write("                    <li><a href=\"ViewAll\">Manage Product</a></li>\n");
      out.write("                    <li><a href=\"ManagePage.jsp\">Manage Page</a></li>\n");
      out.write("                    <li style=\"float: right;\"><a href=\"LogOut\">Logout</a></li>\n");
      out.write("                    <li style=\"float: right;\"><a href=\"Welcome\">Page</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"navigator2\">\n");
      out.write("                <ul>\n");
      out.write("                    <li style=\"cursor: default;\" class=\"active1\"><a>Waiting</a></li>\n");
      out.write("                    <li><a href=\"#\">Accepted</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"orderContainer\">\n");
      out.write("                <h1>Waiting List</h1>\n");
      out.write("                <div id=\"wrapper\">\n");
      out.write("                    <table id=\"keywords\" class=\"table table-hover\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th class=\"thf\" colspan=\"2\"><span>Customer Name</span></th>\n");
      out.write("                                <th class=\"mid\"><span>Company Name</span></th>\n");
      out.write("                                <th class=\"mid\"><span>Total Price</span></th>\n");
      out.write("                                <th class=\"mid\"><span>Status</span></th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                            ");

                              String url = "jdbc:mysql://localhost:3306/BEII";
                              Connection con = null;
                              PreparedStatement ps = null;
                              ResultSet rs = null;
                              PreparedStatement ps1 = null;
                              ResultSet rs1 = null;
                              Blob image = null;

                              try {
                                Class.forName("com.mysql.jdbc.Driver");
                                try {

                                  con = DriverManager.getConnection(url, "root", "");
                                  ps = (PreparedStatement) con.prepareStatement("Select * from customer");
                                  rs = ps.executeQuery();
                                  while (rs.next()) {


                            
      out.write("\n");
      out.write("                            <tr class=\"ftd\">\n");
      out.write("                                <td class=\"clickable\" data-toggle=\"collapse\" id=\"row\" data-target=\"#row");
      out.print(rs.getString("ID"));
      out.write("\"><i class=\"glyphicon glyphicon-plus\"></i></td>\n");
      out.write("                                <td class=\"laman\">");
      out.print(rs.getString("Name"));
      out.write("</td>\n");
      out.write("                                <td class=\"laman\">");
      out.print(rs.getString("CompanyName"));
      out.write("</td>  \n");
      out.write("                                <td class=\"laman\">");
      out.print(rs.getString("Total_Price"));
      out.write("</td>\n");
      out.write("                                <td class=\"laman\">");
      out.print(rs.getString("Status"));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                              ps1 = (PreparedStatement) con.prepareStatement("Select * from customerorder where id = ?");
                              ps1.setString(1, rs.getString("ID"));
                              rs1 = ps1.executeQuery();
                              while (rs1.next()) {
                            
      out.write("\n");
      out.write("                            <tr class=\"collapse\" id=\"row");
      out.print(rs1.getString("ID"));
      out.write("\">\n");
      out.write("                                <td></td>\n");
      out.write("                                <td colspan=\"2\">");
      out.print(rs1.getString("Product"));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rs1.getString("Quantity"));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rs1.getString("Price"));
      out.write("</td> \n");
      out.write("                            </tr>\n");
      out.write("                            ");
 }
                              } 
      out.write("\n");
      out.write("                        \n");
      out.write("                        <script>\n");
      out.write("                            $('#row').click(function () {\n");
      out.write("                                $(this).find('i').toggleClass('glyphicon-plus').toggleClass('glyphicon-minus');\n");
      out.write("                            });\n");
      out.write("                        </script>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("                ");

                    } catch (SQLException e) {

                    } finally {
                      try {
                        con.close();
                        ps = null;
                        rs = null;
                      } catch (SQLException e) {
                      }
                    }
                  } catch (ClassNotFoundException e) {
                    System.out.println(e);
                  }
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
