package function;


import java.sql.*;

// imports here
public class Database {

     public static String url = "jdbc:mysql://localhost:3306/BEII";
     public static String user = "root";
     public static String password = "";
     public static Connection con = null;
     public static PreparedStatement ps = null;
     public static ResultSet rs = null;

    public Database() {

    }
    public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			try
			{
				con = DriverManager.getConnection(url,user,password);
			}
			catch (SQLException ex)
			{
			}
		}
		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
		return con;
	}


    
    public static ResultSet getResult(String sql, Connection con){
        Database.con = con;
        try{
            ps =  (PreparedStatement) con.createStatement();
            rs = ps.executeQuery(sql);
        }catch(SQLException e){
            
        }
        return rs;
    }
    
    
}
