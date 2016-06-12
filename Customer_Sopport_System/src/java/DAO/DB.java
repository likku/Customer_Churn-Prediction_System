package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
/**
*
 * @author SattvaQ */
            public class DB {
public static java.sql.Connection DBConnection()throws Exception
{Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystemonproducts","root","");   
         return con;
 }
}
 