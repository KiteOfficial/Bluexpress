package function;
import java.sql.*;
public class uploadPhoto
{
  /*-------------------------
   *   Get the Blob image
   *------------------------*/
    static String url = "jdbc:mysql://localhost:3306/BEII";
    static Connection con;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
  public static byte[] getPhoto ()
       throws Exception, SQLException
  {
    
    Blob img ;
    byte[] imgData = null ;
    con = DriverManager.getConnection(url, "root", "");
    ps = (PreparedStatement) con.prepareStatement("Select photo from product");
    
    // Query
    
    
    rs  = ps.executeQuery (); 
    
    while (rs.next ())
    {    
      img = rs.getBlob(1);
      imgData = img.getBytes(1,(int)img.length());
    }    
    
    rs.close();
    ps.close();
    
    return imgData ;
  }
  
}